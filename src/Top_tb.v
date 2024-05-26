module test ();
  localparam clk_tk = 10;
  reg clk = 0;
  always #(clk_tk/2) clk = ~clk;

  wire [5:0] led;

  Top top (
      clk,
      led
  );

  initial begin
    $dumpfile("Top.vcd");
    $dumpvars(0, test);

    if(top.counter == 0) $display("test 1 passed"); else $display("test 1 FAILED");

    #clk_tk
    if(top.counter == 1) $display("test 2 passed"); else $display("test 2 FAILED");

    #clk_tk
    if(top.counter == 2) $display("test 3 passed"); else $display("test 3 FAILED");

    #clk_tk
    if(top.counter == 3) $display("test 4 passed"); else $display("test 4 FAILED");

    #clk_tk
    if(top.counter == 4) $display("test 5 passed"); else $display("test 5 FAILED");

    #clk_tk
    if(top.counter == 5) $display("test 6 passed"); else $display("test 6 FAILED");

    #clk_tk
    if(top.counter == 6) $display("test 7 passed"); else $display("test 7 FAILED");

    $finish;
  end

endmodule
