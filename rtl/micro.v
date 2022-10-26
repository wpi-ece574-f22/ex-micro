module micro(input wire clk,
	     input wire        reset,
	     output wire [5:0] mem_addr,
	     output wire [7:0] mem_din,
	     output wire       mem_read,
	     output wire       mem_write,
	     input wire  [7:0] mem_dout);

   reg [7:0] 		       PC;
   reg [7:0] 		       MAR;
   reg [7:0] 		       ACC;
   reg [7:0] 		       MDR;
   reg [7:0] 		       TEMP;
   reg [7:0] 		       IR;

   wire [7:0] 		       PC_next;
   wire [7:0] 		       MAR_next;
   wire [7:0] 		       ACC_next;
   wire [7:0] 		       MDR_next;
   wire [7:0] 		       TEMP_next;
   wire [7:0] 		       IR_next;

   reg [5:0] 		       upc, upc_next;

   localparam 
     T0       = 6'h0,  T1        = 6'h1,  T2      = 6'h2,  T3 = 6'h3,
     T4load   = 6'h4,  T5load    = 6'h5,  T6load  = 6'h6,
     T4add    = 6'h14, T5add     = 6'h15, T6add   = 6'h16, T7add = 5'h17,
     T4store  = 6'h24, T5store   = 6'h25, T6store = 6'h26,
     T4branch = 6'h34, T5branch  = 6'h35;

   always @(posedge clk)
     begin
	if (reset)
	  begin
	     PC   <= 8'b0;
	     MAR  <= 8'b0;
	     ACC  <= 8'b0;
	     MDR  <= 8'b0;
	     TEMP <= 8'b0;
	     IR   <= 8'b0;
	     upc  <= 8'b1;	     
	  end
	else
	  begin
	     PC   <= PC_next;
	     MAR  <= MAR_next;
	     ACC  <= ACC_next;
	     MDR  <= MDR_next;
	     TEMP <= TEMP_next;
	     IR   <= IR_next;
	     upc  <= upc_next;	     
	  end
     end

   wire [7:0] CPUbus;

   // control signals
   reg       ctl_ACC_in;
   reg       ctl_ACC_out;
   reg       ctl_IR_in;
   reg       ctl_IR_out;
   reg       ctl_MAR_in;
   reg       ctl_MDR_in;
   reg       ctl_MDR_out;
   reg       ctl_PC_in;
   reg       ctl_PC_out;
   reg       ctl_PC_inc;
   reg       ctl_memread;
   reg       ctl_TEMP_out;
   reg       ctl_memwrite;
   reg       ctl_aluadd;

   assign PC_next = ctl_PC_in ? CPUbus :
		    ctl_PC_inc ? PC + 8'b1 :
		    PC;

   assign MAR_next = ctl_MAR_in ? CPUbus :
		     MAR;   

   assign ACC_next = ctl_ACC_in ? CPUbus :
		     ACC;

   assign MDR_next = ctl_MDR_in ? CPUbus :
		     ctl_memread ? mem_dout :
		     MDR;

   assign TEMP_next = ctl_aluadd ? MDR + CPUbus :
		      TEMP;

   assign IR_next   = ctl_IR_in ? CPUbus :
		      IR;
    
   assign CPUbus    = ctl_ACC_out  ? ACC :
		      ctl_IR_out   ? {2'b0,IR[5:0]} :
		      ctl_MDR_out  ? MDR :
		      ctl_PC_out   ? PC :
		      ctl_TEMP_out ? TEMP :
		      ctl_IR_out   ? IR :
		      8'b0;

   assign mem_addr = MAR[5:0];
   assign mem_din  = MDR;
   assign mem_write = ctl_memwrite;
   assign mem_read  = ctl_memread;

   always @(*)
     begin
	ctl_ACC_in   = 1'b0;
	ctl_ACC_out  = 1'b0;
	ctl_IR_in    = 1'b0;
	ctl_IR_out   = 1'b0;
	ctl_MAR_in   = 1'b0;
	ctl_MDR_in   = 1'b0;
	ctl_MDR_out  = 1'b0;
	ctl_PC_in    = 1'b0;
	ctl_PC_out   = 1'b0;
	ctl_PC_inc   = 1'b0;
	ctl_memread  = 1'b0;
	ctl_TEMP_out = 1'b0;
	ctl_memwrite = 1'b0;
	ctl_aluadd   = 1'b0;
	upc_next     = upc;
	case (upc)
	  T0:
	    begin
	       ctl_PC_out = 1'b1;
	       ctl_MAR_in = 1'b1;
	       upc_next   = T1;	       
	    end
	  T1:
	    begin
	       ctl_memread = 1'b1;
	       ctl_PC_inc  = 1'b1;
	       upc_next   = T2;	       
	    end
	  T2:
	    begin
	       ctl_MDR_out = 1'b1;
	       ctl_IR_in   = 1'b1;
	       upc_next    = T3;	       
	    end
	  T3:
	    begin
	       if (IR[7:6] == 2'b00)
		 upc_next = T4load;
	       else if (IR[7:6] == 2'b01)
		 upc_next = T4add;
	       else if (IR[7:6] == 2'b10)
		 upc_next = T4store;
	       else
		 upc_next = T4branch;	       
	    end 

	  T4load:
	    begin
	       ctl_IR_out = 1'b1;
	       ctl_MAR_in = 1'b1;
	       upc_next = T5load;
	    end
	  T5load:
	    begin
	       ctl_memread = 1'b1;
	       upc_next    = T6load;
	    end
	  T6load:
	    begin
	       ctl_MDR_out = 1'b1;
	       ctl_ACC_in  = 1'b1;
	       upc_next    = T0;
	    end

	  T4add:
	    begin
	       ctl_IR_out = 1'b1;
	       ctl_MAR_in = 1'b1;
	       upc_next = T5add;
	    end
	  T5add:
	    begin
	       ctl_memread = 1'b1;
	       upc_next    = T6add;
	    end
	  T6add:
	    begin
	       ctl_ACC_out = 1'b1;
	       ctl_aluadd  = 1'b1;
	       upc_next    = T7add;
	    end
	  T7add:
	    begin
	       ctl_TEMP_out = 1'b1;
	       ctl_ACC_in   = 1'b1;
	       upc_next     = T0;
	    end

	  T4store:
	    begin
	       ctl_IR_out  = 1'b1;
	       ctl_MAR_in  = 1'b1;
	       upc_next    = T5store;
	    end
	  T5store:
	    begin
	       ctl_ACC_out = 1'b1;
	       ctl_MDR_in  = 1'b1;
	       upc_next    = T6store;
	    end
	  T6store:
	    begin
	       ctl_memwrite = 1'b1;
	       upc_next     = T0;
	    end

	  T4branch:
	    begin
	       if (ACC == 8'b0)
		 begin
		    ctl_IR_out = 1'b1;
		    ctl_PC_in  = 1'b1;
		 end
	       upc_next = T5branch;
	    end
	  T5branch:
	    begin
	       upc_next = T0;
	    end

	  default:
	    begin
	       upc_next = T0;	       
	    end
	endcase
     end
endmodule
