module stepper_controller(
						input 	wire 				clk, 
						input		wire	[31:0]	stepper_step_in_1,						
						input		wire	[31:0]	stepper_speed_1,
						input		wire	[31:0]	stepper_step_in_2,						
						input		wire	[31:0]	stepper_speed_2,
						input		wire	[31:0]	stepper_step_in_3,						
						input		wire	[31:0]	stepper_speed_3,
						input		wire	[31:0]	stepper_step_in_4,						
						input		wire	[31:0]	stepper_speed_4,
						input		wire				stepper_enable,
						input		wire				xmin,
						input		wire				xmax,
						input		wire				ymin,
						input		wire				ymax,
						input		wire				zmin,
						input		wire				zmax,
						input		wire				homex,
						input		wire				homey,
						input		wire				homez,
						input		wire 				start_driving,
						input		wire 				start_homing,
						
						
						output 	wire 				step_signal_1,
						output 	wire 				enable_1,
						output	wire				dir_1,
						
						output 	wire 				step_signal_2,
						output 	wire 				enable_2,
						output	wire				dir_2,
						
						output 	wire 				step_signal_3,
						output 	wire 				enable_3,
						output	wire				dir_3,
						
						output 	wire 				step_signal_4,
						output 	wire 				enable_4,
						output	wire				dir_4,
						
						output	wire				steppers_driving,
						
						output 	wire 	[31:0] 	stepper_step_out_1,
						output 	wire 	[31:0] 	stepper_step_out_2,
						output 	wire 	[31:0] 	stepper_step_out_3,
						output 	wire 	[31:0] 	stepper_step_out_4);

	
	wire dir_1_h;
	wire dir_2_h;
	wire dir_3_h;
	
	wire dir_1_d;
	wire dir_2_d;
	wire dir_3_d;
	wire dir_4_d;
	
	
	wire step_signal_1_h;
	wire step_signal_2_h;
	wire step_signal_3_h;
	
	wire step_signal_1_d;
	wire step_signal_2_d;
	wire step_signal_3_d;
	wire step_signal_4_d;
	
	wire steppers_driv_h;
	
	wire steppers_driv_d;
	wire steppers_driv_xy;
	wire steppers_driv_z;
	wire steppers_driv_e;
	
	assign steppers_driv_d = steppers_driv_xy | steppers_driv_z | steppers_driv_e;
	
	assign step_signal_1 		= (start_driving ^ start_homing) & ((start_driving & step_signal_1_d) 	| (start_homing & step_signal_1_h));
	assign enable_1 				= ~stepper_enable;
	assign dir_1 					= (start_driving ^ start_homing) & ((start_driving & dir_1_d) 				| (start_homing & dir_1_h));
	
	assign step_signal_2 		= (start_driving ^ start_homing) & ((start_driving & step_signal_2_d) 	| (start_homing & step_signal_2_h));
	assign enable_2 				= ~stepper_enable;
	assign dir_2 					= (start_driving ^ start_homing) & ((start_driving & dir_2_d) 				| (start_homing & dir_2_h));
	
	assign step_signal_3 		= (start_driving ^ start_homing) & ((start_driving & step_signal_3_d) 	| (start_homing & step_signal_3_h));
	assign enable_3 				= ~stepper_enable;
	assign dir_3 					= (start_driving ^ start_homing) & ((start_driving & dir_3_d) 				| (start_homing & dir_3_h));
	
	assign step_signal_4 		= (start_driving ^ start_homing) & (start_driving & step_signal_4_d);
	assign enable_4 				= ~stepper_enable;
	assign dir_4 					= (start_driving ^ start_homing) & (start_driving & dir_4_d);
	
	assign steppers_driving 	= (start_driving ^ start_homing) & ((start_driving & steppers_driv_d) 	| (start_homing & steppers_driv_h));
	
	
	home_g28 home( .clk(clk), 					
						.stepper_speed_1(stepper_speed_1),					
						.stepper_speed_2(stepper_speed_2),
						.stepper_speed_3(stepper_speed_3),
						.stepper_enable(stepper_enable),
						.xmin(xmin),
						.ymin(ymin),
						.zmin(zmin),		
						.homex(homex),
						.homey(homey),
						.homez(homez),
						.start_driving(start_homing),
						
						
						.step_signal_1(step_signal_1_h),
						.dir_1(dir_1_h),
						
						.step_signal_2(step_signal_2_h),
						.dir_2(dir_2_h),
						
						.step_signal_3(step_signal_3_h),
						.dir_3(dir_3_h),
						
						.steppers_driving(steppers_driv_h));
	
	stepper_corexy_new corexy( .clk(clk), 
										.stepper_step_in_1(stepper_step_in_1),						
										.stepper_speed_1(stepper_speed_1),
										.stepper_step_in_2(stepper_step_in_2),						
										.stepper_speed_2(stepper_speed_2),
										.stepper_enable(stepper_enable),
										.xmin(xmin),
										.xmax(xmax),
										.ymin(ymin),
										.ymax(ymax),
										.start_driving(start_driving),
										
										
										.step_signal_1(step_signal_1_d), 
										.dir_1(dir_1_d),
										
										.step_signal_2(step_signal_2_d), 
										.dir_2(dir_2_d),
										
										.steppers_driving(steppers_driv_xy),
										
										.stepper_step_out_1(stepper_step_out_1),
										.stepper_step_out_2(stepper_step_out_2));
	
	stepper_z z(	.clk(clk), 
						.stepper_step_in(stepper_step_in_3),						
						.stepper_speed(stepper_speed_3),
						.stepper_enable(stepper_enable),
						.zmin(zmin),
						.zmax(zmax),
						.start_driving(start_driving),
						
						.step_signal(step_signal_3_d),
						.direction(dir_3_d),
						.stepper_driving(steppers_driv_z),
						.stepper_step_out(stepper_step_out_3));
	
	stepper_extruder( .clk(clk), 
							.stepper_step_in(stepper_step_in_4),						
							.stepper_speed(stepper_speed_4),
							.stepper_enable(stepper_enable),
							.start_driving(start_driving),
							
							.step_signal(step_signal_4_d), 
							.dir(dir_4_d),
							.stepper_driving(steppers_driv_e),
							.stepper_step_out(stepper_step_out_4));



endmodule
