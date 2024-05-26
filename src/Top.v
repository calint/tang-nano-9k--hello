`default_nettype none

module Top (
    input clk,
    output [5:0] led
);

  localparam RAM_ADDR_WIDTH = 9;

  reg [RAM_ADDR_WIDTH-1:0] counter = 0;

  reg ram_enA = 1;
  reg [3:0] ram_weA = 1;
  reg [31:0] ram_dinA = 0;
  wire [31:0] ram_doutA;

  wire [31:0] ram_doutB;

  assign led[5:0] = {
    ram_doutB[31],
    ram_doutB[23],
    ram_doutB[15],
    ram_doutB[11],
    ram_doutB[7],
    ram_doutB[3]
  };

  always @(posedge clk) begin
    counter  <= counter + 1;
    ram_dinA <= counter;
  end

  RAM #(
      .ADDR_WIDTH(RAM_ADDR_WIDTH),
      .DATA_FILE ("RAM.mem")
  ) ram (
      clk,
      ram_weA,
      counter[RAM_ADDR_WIDTH-1:0],
      ram_dinA,
      ram_doutA,
      counter[RAM_ADDR_WIDTH-1:0],
      ram_doutB
  );

endmodule

`default_nettype wire
