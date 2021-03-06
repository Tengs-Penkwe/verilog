`timescale 1ns/1ps
module testbench_top();

	`define CLK_PERIORD		10		//ʱ����������Ϊ10ns��100MHz��

	reg i_clk;
	reg i_rst_n;
	
	reg[3:0]		i_data;
	wire[3:0]		o_sync_data;
	wire[3:0]		o_asyn_data;

	////////////////////////////////////////////////////////////

	vlg_design		uut_vlg_design(
		.i_clk(i_clk),
		.i_rst_n(i_rst_n),
		.i_data(i_data),
		.o_sync_data(o_sync_data),
		.o_asyn_data(o_asyn_data)

		);

	////////////////////////////////////////////////////////////
	initial begin
		i_clk <= 0;
		i_rst_n <= 0;
		#1000;
		i_rst_n <= 1;
	end

		//ʱ�Ӳ���
	always #(`CLK_PERIORD/2) i_clk = ~i_clk;

	////////////////////////////////////////////////////////////

	initial begin

		@(posedge i_rst_n);	//�ȴ�λ���

		@(posedge i_clk);


		repeat(300000) begin
			@(posedge i_clk);
		end

		$stop;
	end


endmodule
