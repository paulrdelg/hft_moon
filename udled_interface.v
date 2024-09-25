
module udled_interface(
    input  wire clk,             // System clock
    input  wire rst,             // Reset signal
    output wire [9:0] LEDG,
    output wire [9:0] LEDR
);

reg [15:0] ledr_d;
reg [15:0] ledr_q;

reg [15:0] ledg_d;
reg [15:0] ledg_q;


// Sequential Logic - Clocked Process
always @(posedge clk or posedge rst) begin
  if (rst) begin
      ledr_q <= 16'b0;
      ledg_q <= 16'b0;
  end else begin
      ledr_q <= ledr_d;
      ledg_q <= ledg_d;
  end
end

// Combinational Logic - Next State Logic
always @(*) begin
  ledr_d <= ledr_q;
  ledg_d <= ledg_q;
end

assign LEDR = ledr_q;
assign LEDG = ledg_q;

endmodule
