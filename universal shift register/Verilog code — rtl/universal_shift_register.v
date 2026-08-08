`timescale 1ns/1ps

module universal_shift_register (
    input  wire       clk,
    input  wire       reset,
    input  wire [1:0] mode,
    input  wire       serial_left,
    input  wire       serial_right,
    input  wire [3:0] parallel_in,
    output reg  [3:0] q
);

    /*
     * Mode selection:
     *
     * 00 -> Hold
     * 01 -> Shift Right
     * 10 -> Shift Left
     * 11 -> Parallel Load
     */

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else begin
            case (mode)

                2'b00: begin
                    // Hold
                    q <= q;
                end

                2'b01: begin
                    // Shift Right
                    q <= {serial_right, q[3:1]};
                end

                2'b10: begin
                    // Shift Left
                    q <= {q[2:0], serial_left};
                end

                2'b11: begin
                    // Parallel Load
                    q <= parallel_in;
                end

                default:
                    q <= q;

            endcase
        end
    end

endmodule