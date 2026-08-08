`timescale 1ns/1ps

module tb_universal_shift_register;

    reg        clk;
    reg        reset;
    reg  [1:0] mode;
    reg        serial_left;
    reg        serial_right;
    reg  [3:0] parallel_in;
    wire [3:0] q;

    // Instantiate DUT
    universal_shift_register uut (
        .clk          (clk),
        .reset        (reset),
        .mode         (mode),
        .serial_left  (serial_left),
        .serial_right (serial_right),
        .parallel_in  (parallel_in),
        .q             (q)
    );

    // 10 ns clock
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("universal_shift_register.vcd");
        $dumpvars(0, tb_universal_shift_register);

        // Initial values
        clk          = 1'b0;
        reset        = 1'b1;
        mode         = 2'b00;
        serial_left  = 1'b0;
        serial_right = 1'b0;
        parallel_in  = 4'b0000;

        $display("================================================");
        $display("       4-BIT UNIVERSAL SHIFT REGISTER TEST");
        $display("================================================");
        $display("Time\tReset\tMode\tParallel\tSerialL\tSerialR\tQ");
        $display("------------------------------------------------");

        $monitor("%0t\t%b\t%b\t%b\t\t%b\t%b\t%b",
                 $time,
                 reset,
                 mode,
                 parallel_in,
                 serial_left,
                 serial_right,
                 q);

        // Reset
        #12;
        reset = 1'b0;

        // ------------------------------------------------
        // Parallel Load
        // ------------------------------------------------
        #3;
        mode = 2'b11;
        parallel_in = 4'b1010;

        #10;

        // ------------------------------------------------
        // Hold
        // ------------------------------------------------
        mode = 2'b00;

        #10;

        // ------------------------------------------------
        // Shift Right
        // ------------------------------------------------
        mode = 2'b01;
        serial_right = 1'b1;

        #10;

        serial_right = 1'b0;

        #10;

        // ------------------------------------------------
        // Shift Left
        // ------------------------------------------------
        mode = 2'b10;
        serial_left = 1'b1;

        #10;

        serial_left = 1'b0;

        #10;

        // Finish
        $display("------------------------------------------------");
        $display("Simulation completed successfully.");

        $finish;

    end

endmodule