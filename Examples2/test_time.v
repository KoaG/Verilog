`timescale 10ms/100us
module test_time();
reg a;

initial begin
#3 a = 1'b0; $display($realtime);
#3.1 a = 1'b1; $display($realtime);
#3.11 a = 1'b0; $display($realtime,"i");
#3.79 a = 1'b1; $display($realtime);
#3.1 a = 1'b0; $display($realtime);
#3.11 a = 1'b1; $display($realtime);
end

endmodule 