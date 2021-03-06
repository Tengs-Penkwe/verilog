`timescale 1ns/1ps

module vlg_design(
	input i_clk,
	input i_rst_n,
	input[3:0] i_data,
	output reg[3:0] o_sync_data,
	output reg[3:0] o_asyn_data
);
	always @(posedge i_clk)
		if (!i_rst_n) o_sync_data < 4'd0;
		else o_sync_data <= i_data;

	always @(posedge i_clk or negedge i_rst_n)
		if (!i_rst_n) o_asyn_data < 4'd0;
		else o_asyn_data <= i_data;

endmodule
