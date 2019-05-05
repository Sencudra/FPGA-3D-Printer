 module clk_gen(
						input 	wire 				clk, 
						input		wire	[31:0]	reduction,
						input 	wire 	[30:0] 	count,
						input 	wire 				reset,
						
						output 	wire 				clk_out, //Максимально 25 MHz при reduction = 1
						output 	wire 				finish,
						output 	wire 	[30:0] 	remainder);
	
	reg [31:0] 	m		 	= 0;

	reg 			signal 	= 1'b0;
	
	reg [30:0] 	n		 	= 0;
	
	reg 			check	 	= 1'b1;
	
	reg 			fin 		= 1'b1;
	
	reg [4:0] 	delay 	= 0;
	
	assign clk_out = signal;
	assign finish = fin;
	assign remainder = n;
	
	
	always @(posedge clk)
	begin		
		if (delay == 0)
		begin
			if (reset == 1'b1)
			begin
				if (fin == 1'b1)
				begin
					fin 	= 1'b0;
					signal 	= 1'b1;
					n = count;
					m = reduction - 1;
				end		
				else
				begin
					if (n != 0)
					begin
						if (m != 0)
							m = m - 1;
						else
							begin
								signal = ~signal;
								m = reduction - 1;
								if (signal == 0)
									n = n - 1;
							end
					end
					else
					begin
						signal = 1'b0;
						fin = 1'b1;
						delay = 5;
					end
				end
			end
			else
			begin
				if (signal == 1)
					n = n - 1;
				signal = 1'b0;
				fin = 1'b1;
			end
		end
		else
		begin
			delay = delay - 1;
		end
		
	end
	
	
	
endmodule
