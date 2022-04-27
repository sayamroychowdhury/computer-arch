module Seq_Det (output reg ERR,
		input wire Clock, Reset, Din);

   reg [2:0] 		   current_state, next_state;
   parameter 
     start      = 3'b000,
     D0_is_1    = 3'b001,
     D1_is_1    = 3'b010,
     D0_not_1   = 3'b011,
     D1_not_1   = 3'b100;
   
   always @ (posedge Clock or negedge Reset)
     begin: STATE_MEMORY
	if(!Reset)
	  current_state <= start;
	else
	  current_state <= next_state;
     end
 
   always @ (current_state or Din)
     begin: NEXT_STATE_LOGIC
	case (current_state)
	  start    : 
	    if(Din == 1'b1)
              next_state = D0_is_1;
            else
              next_state = D0_not_1;
	  
	  D0_is_1  : 
	    if (Din == 1'b1)
              next_state = D1_is_1;
            else
              next_state = D1_not_1;
	  
	  D1_is_1  : next_state = start;
	  D0_not_1 : next_state = D1_not_1;
	  D1_not_1 : next_state = start;
	  default: next_state = start;
	endcase
     end            

   always @ (current_state or Din)
     begin : OUTPUT_LOGIC
	case (current_state) 
	  D1_is_1  : if(Din == 1'b1)
            ERR = 1'b0;
          
	  default : ERR = 1'b0;
	endcase
     end
endmodule                              
