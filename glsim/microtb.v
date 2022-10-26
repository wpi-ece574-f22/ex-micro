module microtb();

   reg 	       clk, reset;
   wire [7:0]  mem_din;
   wire [5:0]  mem_addr;
   wire [7:0]   mem_dout;
   wire        mem_read;
   wire        mem_write;
   
   micro dut(.clk(clk), 
  	     .reset(reset),
	     .mem_din(mem_din),
	     .mem_addr(mem_addr),
	     .mem_dout(mem_dout),
	     .mem_read(mem_read),
	     .mem_write(mem_write));

   extmem M(.mem_din(mem_din),
	    .mem_addr(mem_addr),
	    .mem_dout(mem_dout),
	    .mem_read(mem_read),
	    .mem_write(mem_write));
   
   always
     begin
	clk = 1'b0;
	#5;
	clk = 1'b1;
	#5;
     end
   
   integer i;
   initial
     begin	
	$dumpfile("trace.vcd");
	$dumpvars(0, microtb);
	
	reset = 1'b1;
	repeat (3) @(posedge clk);
	reset = 1'b0;

	repeat (100) @(posedge clk);

	$finish;
     end
   
endmodule

module extmem(input wire [7:0] mem_din,
	      input wire [5:0] mem_addr,
	      input wire       mem_read,
	      input wire       mem_write,
	      output wire [7:0] mem_dout);

   reg [7:0] 		       mem00;
   reg [7:0] 		       mem01;
   reg [7:0] 		       mem02;
   reg [7:0] 		       mem03;
   reg [7:0] 		       mem04;
   reg [7:0] 		       mem05;
   reg [7:0] 		       mem06;
   reg [7:0] 		       mem07;
   reg [7:0] 		       mem08;
   reg [7:0] 		       mem09;
   reg [7:0] 		       mem0A;
   reg [7:0] 		       mem0B;
   reg [7:0] 		       mem0C;
   reg [7:0] 		       mem0D;
   reg [7:0] 		       mem0E;
   reg [7:0] 		       mem0F;
   reg [7:0] 		       mem10;
   reg [7:0] 		       mem11;
   reg [7:0] 		       mem12;
   reg [7:0] 		       mem13;
   reg [7:0] 		       mem14;
   reg [7:0] 		       mem15;
   reg [7:0] 		       mem16;
   reg [7:0] 		       mem17;
   reg [7:0] 		       mem18;
   reg [7:0] 		       mem19;
   reg [7:0] 		       mem1A;
   reg [7:0] 		       mem1B;
   reg [7:0] 		       mem1C;
   reg [7:0] 		       mem1D;
   reg [7:0] 		       mem1E;
   reg [7:0] 		       mem1F;
   reg [7:0] 		       mem20;
   reg [7:0] 		       mem21;
   reg [7:0] 		       mem22;
   reg [7:0] 		       mem23;
   reg [7:0] 		       mem24;
   reg [7:0] 		       mem25;
   reg [7:0] 		       mem26;
   reg [7:0] 		       mem27;
   reg [7:0] 		       mem28;
   reg [7:0] 		       mem29;
   reg [7:0] 		       mem2A;
   reg [7:0] 		       mem2B;
   reg [7:0] 		       mem2C;
   reg [7:0] 		       mem2D;
   reg [7:0] 		       mem2E;
   reg [7:0] 		       mem2F;
   reg [7:0] 		       mem30;
   reg [7:0] 		       mem31;
   reg [7:0] 		       mem32;
   reg [7:0] 		       mem33;
   reg [7:0] 		       mem34;
   reg [7:0] 		       mem35;
   reg [7:0] 		       mem36;
   reg [7:0] 		       mem37;
   reg [7:0] 		       mem38;
   reg [7:0] 		       mem39;
   reg [7:0] 		       mem3A;
   reg [7:0] 		       mem3B;
   reg [7:0] 		       mem3C;
   reg [7:0] 		       mem3D;
   reg [7:0] 		       mem3E;
   reg [7:0] 		       mem3F;

`define LOADINS   8'b00000000
`define ADDINS    8'b01000000
`define STOREINS  8'b10000000
`define BRANCHINS 8'b11000000
   
   initial
     begin
	mem00  = `BRANCHINS | 8'd16;
	mem01  = 8'hAA;
	mem02  = 8'h55;
	mem03  = 8'h0;
	mem04  = 8'h0;	
	mem10  = `LOADINS  | 8'd1;
	mem11  = `ADDINS   | 8'd2;
	mem12  = `STOREINS | 8'd3;
	mem13  = `LOADINS  | 8'd4;
	mem14  = `BRANCHINS | 8'd16;
     end

   always @(*)
     if (mem_write)
       begin
	  case(mem_addr)
	    8'h00: mem00 = mem_din;
	    8'h01: mem01 = mem_din;
	    8'h02: mem02 = mem_din;
	    8'h03: mem03 = mem_din;
	    8'h04: mem04 = mem_din;
	    8'h05: mem05 = mem_din;
	    8'h06: mem06 = mem_din;
	    8'h07: mem07 = mem_din;
	    8'h08: mem08 = mem_din;
	    8'h09: mem09 = mem_din;
	    8'h0A: mem0A = mem_din;
	    8'h0B: mem0B = mem_din;
	    8'h0C: mem0C = mem_din;
	    8'h0D: mem0D = mem_din;
	    8'h0E: mem0E = mem_din;
	    8'h0F: mem0F = mem_din;
	    8'h10: mem10 = mem_din;
	    8'h11: mem11 = mem_din;
	    8'h12: mem12 = mem_din;
	    8'h13: mem13 = mem_din;
	    8'h14: mem14 = mem_din;
	    8'h15: mem15 = mem_din;
	    8'h16: mem16 = mem_din;
	    8'h17: mem17 = mem_din;
	    8'h18: mem18 = mem_din;
	    8'h19: mem19 = mem_din;
	    8'h1A: mem1A = mem_din;
	    8'h1B: mem1B = mem_din;
	    8'h1C: mem1C = mem_din;
	    8'h1D: mem1D = mem_din;
	    8'h1E: mem1E = mem_din;
	    8'h1F: mem1F = mem_din;
	    8'h20: mem20 = mem_din;
	    8'h21: mem21 = mem_din;
	    8'h22: mem22 = mem_din;
	    8'h23: mem23 = mem_din;
	    8'h24: mem24 = mem_din;
	    8'h25: mem25 = mem_din;
	    8'h26: mem26 = mem_din;
	    8'h27: mem27 = mem_din;
	    8'h28: mem28 = mem_din;
	    8'h29: mem29 = mem_din;
	    8'h2A: mem2A = mem_din;
	    8'h2B: mem2B = mem_din;
	    8'h2C: mem2C = mem_din;
	    8'h2D: mem2D = mem_din;
	    8'h2E: mem2E = mem_din;
	    8'h2F: mem2F = mem_din;
	    8'h30: mem30 = mem_din;
	    8'h31: mem31 = mem_din;
	    8'h32: mem32 = mem_din;
	    8'h33: mem33 = mem_din;
	    8'h34: mem34 = mem_din;
	    8'h35: mem35 = mem_din;
	    8'h36: mem36 = mem_din;
	    8'h37: mem37 = mem_din;
	    8'h38: mem38 = mem_din;
	    8'h39: mem39 = mem_din;
	    8'h3A: mem3A = mem_din;
	    8'h3B: mem3B = mem_din;
	    8'h3C: mem3C = mem_din;
	    8'h3D: mem3D = mem_din;
	    8'h3E: mem3E = mem_din;
	    8'h3F: mem3F = mem_din;
	  endcase
       end

   reg [7:0] mem_dout_reg;
   
   always @(*)
     if (mem_read)
       begin
	  case(mem_addr)
	    8'h00: mem_dout_reg = mem00;
	    8'h01: mem_dout_reg = mem01;
	    8'h02: mem_dout_reg = mem02;
	    8'h03: mem_dout_reg = mem03;
	    8'h04: mem_dout_reg = mem04;
	    8'h05: mem_dout_reg = mem05;
	    8'h06: mem_dout_reg = mem06;
	    8'h07: mem_dout_reg = mem07;
	    8'h08: mem_dout_reg = mem08;
	    8'h09: mem_dout_reg = mem09;
	    8'h0A: mem_dout_reg = mem0A;
	    8'h0B: mem_dout_reg = mem0B;
	    8'h0C: mem_dout_reg = mem0C;
	    8'h0D: mem_dout_reg = mem0D;
	    8'h0E: mem_dout_reg = mem0E;
	    8'h0F: mem_dout_reg = mem0F;
	    8'h10: mem_dout_reg = mem10;
	    8'h11: mem_dout_reg = mem11;
	    8'h12: mem_dout_reg = mem12;
	    8'h13: mem_dout_reg = mem13;
	    8'h14: mem_dout_reg = mem14;
	    8'h15: mem_dout_reg = mem15;
	    8'h16: mem_dout_reg = mem16;
	    8'h17: mem_dout_reg = mem17;
	    8'h18: mem_dout_reg = mem18;
	    8'h19: mem_dout_reg = mem19;
	    8'h1A: mem_dout_reg = mem1A;
	    8'h1B: mem_dout_reg = mem1B;
	    8'h1C: mem_dout_reg = mem1C;
	    8'h1D: mem_dout_reg = mem1D;
	    8'h1E: mem_dout_reg = mem1E;
	    8'h1F: mem_dout_reg = mem1F;
	    8'h20: mem_dout_reg = mem20;
	    8'h21: mem_dout_reg = mem21;
	    8'h22: mem_dout_reg = mem22;
	    8'h23: mem_dout_reg = mem23;
	    8'h24: mem_dout_reg = mem24;
	    8'h25: mem_dout_reg = mem25;
	    8'h26: mem_dout_reg = mem26;
	    8'h27: mem_dout_reg = mem27;
	    8'h28: mem_dout_reg = mem28;
	    8'h29: mem_dout_reg = mem29;
	    8'h2A: mem_dout_reg = mem2A;
	    8'h2B: mem_dout_reg = mem2B;
	    8'h2C: mem_dout_reg = mem2C;
	    8'h2D: mem_dout_reg = mem2D;
	    8'h2E: mem_dout_reg = mem2E;
	    8'h2F: mem_dout_reg = mem2F;
	    8'h30: mem_dout_reg = mem30;
	    8'h31: mem_dout_reg = mem31;
	    8'h32: mem_dout_reg = mem32;
	    8'h33: mem_dout_reg = mem33;
	    8'h34: mem_dout_reg = mem34;
	    8'h35: mem_dout_reg = mem35;
	    8'h36: mem_dout_reg = mem36;
	    8'h37: mem_dout_reg = mem37;
	    8'h38: mem_dout_reg = mem38;
	    8'h39: mem_dout_reg = mem39;
	    8'h3A: mem_dout_reg = mem3A;
	    8'h3B: mem_dout_reg = mem3B;
	    8'h3C: mem_dout_reg = mem3C;
	    8'h3D: mem_dout_reg = mem3D;
	    8'h3E: mem_dout_reg = mem3E;
	    8'h3F: mem_dout_reg = mem3F;
	  endcase
       end

   assign mem_dout = mem_dout_reg;
      
endmodule 

