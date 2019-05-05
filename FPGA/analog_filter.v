module analog_filter #(parameter samples = 5)(
							input 	wire				clk,
							input 	wire	[11:0]	signal_in,
							output	wire	[11:0]	signal_out);
							
	reg	[11:0] 				history [samples - 1:0];
	reg	[15:0] 				num = 0;
	reg	[15:0] 				i	 = 0;
	reg 	[11 + samples:0] 	out, out1;
	
	
	always @(posedge clk)
	begin
		history[num] = signal_in;
		if (num < samples)
			num = num + 1;
		else
			num = 0;
		out1 = 0;
		for(i = 0; i < samples; i = i + 1)
		begin
			out1 = out1 + history[i];
		end
		out = out1 / samples;
	end
	
	assign	signal_out = out[11:0];
endmodule
