module mux_1
  (input wire a, b, c, d, s0, s1,
   output wire e);

   assign e = (~s0&~s1&a)|(~s0&s1&b)|(s0&~s1&c)|(s0&s1&d);
  endmodule
