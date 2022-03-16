module demux
  (input a, s0, s1,
   output wire b, c, d, e);
   assign b = (~s0&~s1&a), c = (~s0&s1&a), d = (s0&~s1&a), e = (s0&s1&a);
endmodule // demux
module tg
  (output reg a, s0, s1,
   input wire b, c, d, e);

   initial begin
      $monitor($time,,,"{a} = %b, {s0, s1} = %b%b, {b,c,d,e} = %b%b%b%b", a, s0, s1, b, c, d, e);

      #1 a = 1'b0;
      s0 = 1'b0;
      s1 = 1'b0;

      #1 a = 1'b0;
      s0 = 1'b0;
      s1 = 1'b1;

      #1 a = 1'b0;
      s0 = 1'b1;
      s1 = 1'b0;
      
      #1 a = 1'b0;
      s0 = 1'b1;
      s1 = 1'b1;
      
      #1 a = 1'b1;
      s0 = 1'b0;
      s1 = 1'b0;

      #1 a = 1'b1;
      s0 = 1'b0;
      s1 = 1'b1;

      #1 a = 1'b1;
      s0 = 1'b1;
      s1 = 1'b0;
      
      #1 a = 1'b1;
      s0 = 1'b1;
      s1 = 1'b1;

      #1 $finish;

   end // initial begin
endmodule // tg

module wb;
   wire a, s0, s1, b, c, d, e;
   demux dut(a, s0, s1, b, c, d, e);
   
   tg mytg(a, s0, s1, b, c, d, e);

endmodule // wb

