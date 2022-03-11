module mux
  (input wire a, b, c, d, s0, s1,
   output wire e);
   assign e = (~s0&~s1&a) + (~s0&s1&b) + (s0&~s1&c) + (s0&s1&d);
endmodule
module tg
  (output reg  a, b, c, d, s0, s1,
   input wire e);

   initial begin
      $monitor($time,,, "{a,b,c,d} = %b%b%b%b, {s0, s1} = %b%b, e = %b", a, b, c, d, s0, s1, e);

      #1 a = 1'b1;
      b = 1'b0;
      c = 1'b1;
      d = 1'b0;
      s0 = 1'b0;
      s1 = 1'b0;

      #1 s1 = 1'b1;

      #1 s0 = 1'b1;

      #1 s0 = 1'b1;
      s1 = 1'b1;
      

      #1 $finish;

   end // initial begin
endmodule // tg

module wb;
   wire a, b, c, d, e, s0, s1;
   mux dut(a, b, c, d, s0, s1, e);

   tg mytg(a, b, c, d, s0, s1, e);

endmodule // wb

