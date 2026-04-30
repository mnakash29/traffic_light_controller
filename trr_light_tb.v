
module tb_traffic_light_controller;

  reg clk;
  reg rst;
  wire [2:0] light_m1;
  wire [2:0] light_s;
  wire [2:0] light_mt;
  wire [2:0] light_m2;
  traffic_light_controller uut (
    .clk(clk),
    .rst(rst),
    .light_m1(light_m1),
    .light_s(light_s),
    .light_mt(light_mt),
    .light_m2(light_m2)
  );

    always #5 clk = ~clk;

  initial begin
        clk = 0;
    rst = 1;
    #20;
    rst = 0;
    #200;
    rst = 1;
    #10;
    rst = 0;
    #200;

    $finish;
  end
  initial begin
    $monitor("Time=%0t | State Lights: M1=%b M2=%b MT=%b S=%b",
              $time, light_m1, light_m2, light_mt, light_s);
  end

endmodule
