
module hex_interface (
    input  wire clk,             // System clock
    input  wire rst,             // Reset signal
    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2,
    output reg [6:0] HEX3
);

reg [6:0] hex0_d;
reg [6:0] hex0_q;

reg [6:0] hex1_d;
reg [6:0] hex1_q;

reg [6:0] hex2_d;
reg [6:0] hex2_q;

reg [6:0] hex3_d;
reg [6:0] hex3_q;


// Sequential Logic - Clocked Process
always @(posedge clk or posedge rst) begin
  if (rst) begin
      hex0_q <= 7'b0;
      hex1_q <= 7'b0;
      hex2_q <= 7'b0;
      hex3_q <= 7'b0;
  end else begin
      hex0_q <= hex0_d;
      hex1_q <= hex1_d;
      hex2_q <= hex2_d;
      hex3_q <= hex3_d;
  end
end

// Combinational Logic - Next State Logic
always @(*) begin
  hex0_d <= hex0_q;
  hex1_d <= hex1_q;
  hex2_d <= hex2_q;
  hex3_d <= hex3_q;
end

HEX0 <= hex0_q;
HEX1 <= hex1_q;
HEX2 <= hex2_q;
HEX3 <= hex3_q;

endmodule
