module home_g28(
						input 	wire 				clk, 					
						input		wire	[31:0]	stepper_speed_1,					
						input		wire	[31:0]	stepper_speed_2,
						input		wire	[31:0]	stepper_speed_3,
						input		wire				stepper_enable,
						input		wire				xmin,
						input		wire				ymin,
						input		wire				zmin,
						input		wire				homex,
						input		wire				homey,
						input		wire				homez,
						input		wire 				start_driving,
						
						
						output 	wire 				step_signal_1,
						output	wire				dir_1,
						
						output 	wire 				step_signal_2,
						output	wire				dir_2,
						
						output 	wire 				step_signal_3,
						output	wire				dir_3,
						
						output	wire				steppers_driving);
						
						
	reg [31:0] m1 = 0;
	reg [31:0] m2 = 0;
	reg [31:0] m3 = 0;
	
	
	reg [31:0] n1 = 0;
	reg [31:0] n2 = 0;
	reg [31:0] n3 = 0;
	
	reg [1:0] f = 0;
	
	reg dir1 = 0;
	reg dir2 = 0;
	reg dir3 = 0;
	
	reg signal_1 = 0;
	reg signal_2 = 0;
	reg signal_3 = 0;
	
	assign dir_1 = dir1;
	assign dir_2 = dir2;
	assign dir_3 = dir3;
	
	assign step_signal_1 = signal_1;	
	assign step_signal_2 = signal_2;	
	assign step_signal_3 = signal_3;	

	
	assign steppers_driving = start_driving & (homex & !xmin | homey & !ymin | homez & !zmin);
	
	
	always @(posedge clk)
	begin		
		if (start_driving == 1)
		begin
			dir3 = 0;
			if (!zmin & homez)
			begin
				if (m3 == 0)
				begin
					m3 = stepper_speed_3;
					n3 = (m3 / 2);
					signal_3 = 1;
				end
				else
				begin
					m3 = m3 - 1;
					if (n3 == 0)
						signal_3 = 0;
					else
						n3 = n3 - 1;
				end
			end
			else
			begin
				m3 = 0;
				n3 = 0;
				signal_3 = 0;
			end
		end
	end
	
	always @(posedge clk)
	begin
		if (start_driving == 1)
			begin
			if (!xmin & !ymin & homex & homey)
			begin
				if (f != 0)
				begin
					f = 0;
					m1 = 0;
					m2 = 0;
					dir1 = 1;
					dir2 = 0;
					signal_1 = 0;
					signal_2 = 0;
				end			
				
				if (m1 == 0)
				begin
					m1 = stepper_speed_1;
					n1 = (m1 / 2);
					signal_1 = 1;
				end
				else
				begin
					m1 = m1 - 1;
					if (n1 == 0)
						signal_1 = 0;
					else
						n1 = n1 - 1;
				end
				
				signal_2 = 0;
			end
			else
			begin
				if (!xmin & homex)
				begin
					if (f != 1)
					begin
						f = 1;
						m1 = 0;
						m2 = 0;
						dir1 = 1;
						dir2 = 1;
						signal_1 = 0;
						signal_2 = 0;
					end
					
					if (m1 == 0)
					begin
						m1 = stepper_speed_1;
						n1 = (m1 / 2);
						signal_1 = 1;
					end
					else
					begin
						m1 = m1 - 1;
						if (n1 == 0)
							signal_1 = 0;
						else
							n1 = n1 - 1;
					end
					
					if (m2 == 0)
					begin
						m2 = stepper_speed_2;
						n2 = (m2 / 2);
						signal_2 = 1;
					end
					else
					begin
						m2 = m2 - 1;
						if (n2 == 0)
							signal_2 = 0;
						else
							n2 = n2 - 1;
					end
				end
				else
				begin
					if (!ymin & homey)
					begin
						if (f != 2)
						begin
							f = 2;
							m1 = 0;
							m2 = 0;
							dir1 = 1;
							dir2 = 0;
							signal_1 = 0;
							signal_2 = 0;
						end
						
						if (m1 == 0)
						begin
							m1 = stepper_speed_1;
							n1 = (m1 / 2);
							signal_1 = 1;
						end
						else
						begin
							m1 = m1 - 1;
							if (n1 == 0)
								signal_1 = 0;
							else
								n1 = n1 - 1;
						end
						
						if (m2 == 0)
						begin
							m2 = stepper_speed_2;
							n2 = (m2 / 2);
							signal_2 = 1;
						end
						else
						begin
							m2 = m2 - 1;
							if (n2 == 0)
								signal_2 = 0;
							else
								n2 = n2 - 1;
						end
					end
					else
					begin
						m1 = 0;
						m2 = 0;
						n1 = 0;
						n2 = 0;
						signal_1 = 0;
						signal_2 = 0;
					end
				end
			end
		end
	end


endmodule
