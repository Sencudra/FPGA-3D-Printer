 module stepper_corexy_new(
						input 	wire 				clk, 
						input		wire	[31:0]	stepper_step_in_1,						
						input		wire	[31:0]	stepper_speed_1,
						input		wire	[31:0]	stepper_step_in_2,						
						input		wire	[31:0]	stepper_speed_2,
						input		wire				stepper_enable,
						input		wire				xmin,
						input		wire				xmax,
						input		wire				ymin,
						input		wire				ymax,
						input		wire 				start_driving,
						
						
						output 	wire 				step_signal_1, 
						output	wire				dir_1,
						
						output 	wire 				step_signal_2, 
						output	wire				dir_2,
						
						output	wire				steppers_driving,
						
						output 	wire 	[31:0] 	stepper_step_out_1,
						output 	wire 	[31:0] 	stepper_step_out_2);
	
		
	reg [30:0] 	n_1	 						= 0;
	reg [31:0] 	m_1	 						= 0;
	
	reg [30:0] 	n_2	 						= 0;
	reg [31:0] 	m_2	 						= 0;
	
	reg 			signal_1						= 0;
	reg 			signal_2						= 0;	
	
	reg 			direction_1					= 0;
	reg 			direction_2					= 0;		
	
	reg			stepper_driving_reg_1 	= 0;
	reg			stepper_driving_reg_2 	= 0;
	
	reg [31:0]	stepper_step_1				= 0;
	reg [31:0]	stepper_step_2				= 0;	
	
	reg [31:0]	stepper_speed_reg_1		= 0;
	reg [31:0]	stepper_speed_reg_2		= 0;
	
	reg 			step_changed	 			= 0;
	
	reg [31:0]	recount						= 0;
	
	reg			f								= 0;
	
	reg [1:0]	x								= 0; //0 - =; 1 - -; 2 - +;
	reg [1:0]	y								= 0; //0 - =; 1 - -; 2 - +;
	
	
	assign steppers_driving = stepper_driving_reg_1 | stepper_driving_reg_2;	
	
	assign step_signal_1 = signal_1;	
	assign step_signal_2 = signal_2;	
	
	assign dir_1 = direction_1;
	assign dir_2 = direction_2;
	
	assign stepper_step_out_1 = stepper_step_1;
	assign stepper_step_out_2 = stepper_step_2;
	
	
	always @(posedge clk)
	begin	
		if (~stepper_driving_reg_1 & ~stepper_driving_reg_2 & ~f)
		begin
			if (start_driving == 1'b1)
				if ((stepper_step_in_1[30:0] != 0) | (stepper_step_in_2[30:0] != 0))
				begin
					stepper_step_1 = stepper_step_in_1;
					stepper_step_2 = stepper_step_in_2;
					
					stepper_speed_reg_1 = stepper_speed_1;
					stepper_speed_reg_2 = stepper_speed_2;
					
					stepper_driving_reg_1 = 1'b1;
					stepper_driving_reg_2 = 1'b1;
					
					signal_1 = 1'b1;	
					signal_2 = 1'b1;	
					
					n_1 = stepper_step_1[30:0];
					n_2 = stepper_step_2[30:0];
					
					direction_1 = stepper_step_1[31];
					direction_2 = stepper_step_2[31];
					
					if (stepper_step_1[31])
						n_1 = ~n_1 + 1;
					m_1 = stepper_speed_reg_1 - 1;
					
					if (stepper_step_2[31])
						n_2 = ~n_2 + 1;
					m_2 = stepper_speed_reg_2 - 1;
					
					step_changed = 0;	
		
					f = 1;					
					
					//Вычисление направления движения по осям x и y
					if ((direction_1 == 0) & (direction_2 == 0))
					begin
						x = 2;
						if (n_1 > n_2)
							y = 2;
						else 
						begin
							if (n_1 == n_2)
								y = 0;
							else
								y = 1;
						end
					end
					
					if ((direction_1 == 0) & (direction_2 == 1))
					begin
						y = 2;
						if (n_1 > n_2)
							x = 2;
						else 
						begin
							if (n_1 == n_2)
								x = 0;
							else
								x = 1;
						end
					end
					
					if ((direction_1 == 1) & (direction_2 == 0))
					begin
						y = 1;
						if (n_2 > n_1)
							x = 2;
						else 
						begin
							if (n_1 == n_2)
								x = 0;
							else
								x = 1;
						end
					end
					
					if ((direction_1 == 1) & (direction_2 == 1))
					begin
						x = 1;
						if (n_2 > n_1)
							y = 2;
						else 
						begin
							if (n_1 == n_2)
								y = 0;
							else
								y = 1;
						end
					end
					
				end
		end
		else
		begin	
			if (((xmin & (x != 1)) | (xmax & (x != 2)) | (!xmin & !xmax)) & ((ymin & (y != 1)) | (ymax & (ymax != 2)) | (!ymin & !ymax)))
			begin
				if (stepper_driving_reg_1)
				begin
					if (n_1 != 0)
					begin
						if (m_1 != 0)
							m_1 = m_1 - 1;
						else
							begin
								signal_1 = ~signal_1;
								m_1 = stepper_speed_reg_1 - 1;
								if (signal_1 == 0)
									n_1 = n_1 - 1;
								if (direction_1 == 1'b0)
									stepper_step_1 = {direction_1, n_1};
								else
									stepper_step_1 = {direction_1, ~n_1 + 1};
							end				
					end
					else
					begin
						if (signal_1 == 1)
							n_1 = n_1 - 1;
						signal_1 = 1'b0;
						stepper_driving_reg_1 = 1'b0;
						if (direction_1 == 1'b0)
							stepper_step_1 = {direction_1, n_1};
						else
							stepper_step_1 = {direction_1, ~n_1 + 1};
					end
				end
				
				if (stepper_driving_reg_2)
				begin
					if (n_2 != 0)
					begin
						if (m_2 != 0)
							m_2 = m_2 - 1;
						else
							begin
								signal_2 = ~signal_2;
								m_2 = stepper_speed_reg_2 - 1;
								if (signal_2 == 0)
									n_2 = n_2 - 1;
								if (direction_2 == 1'b0)
									stepper_step_2 = {direction_2, n_2};
								else
									stepper_step_2 = {direction_2, ~n_2 + 1};
							end
						
					end
					else
					begin
						if (signal_2 == 1)
							n_2 = n_2 - 1;
						signal_2 = 1'b0;
						stepper_driving_reg_2 = 1'b0;
						if (direction_2 == 1'b0)
							stepper_step_2 = {direction_2, n_2};
						else
							stepper_step_2 = {direction_2, ~n_2 + 1};
					end
				end
			end
			else
			begin
				if (signal_1 == 1)
					n_1 = n_1 - 1;
				signal_1 = 1'b0;
				stepper_driving_reg_1 = 1'b0;
				if (direction_1 == 1'b0)
					stepper_step_1 = {direction_1, n_1};
				else
					stepper_step_1 = {direction_1, ~n_1 + 1};
				
				if (signal_2 == 1)
					n_2 = n_2 - 1;
				signal_2 = 1'b0;
				stepper_driving_reg_2 = 1'b0;
				if (direction_2 == 1'b0)
					stepper_step_2 = {direction_2, n_2};
				else
					stepper_step_2 = {direction_2, ~n_2 + 1};
			end
		end	
		if (start_driving == 0)
			f = 0;
	end
	
	
	
endmodule
