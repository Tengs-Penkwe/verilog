module AndOr (AandB, AorB, A,B);
	output[1:0] AandB, AorB;
	input [1:0] A,B;

	and myAnd [1:0] (AandB[1:0], A[1:0], B[1:0]);
	or  myOr  [1:0] (AorB [1:0], A[1:0], B[1:0]);

endmodule

module Tester (xOut, yOut, XandYin, XorYin);
	
	input [1:0] XandYin	, XorYin;
	output [1:0] xOut, yOut; 
	reg [1:0] xOut, yOut;

	parameter stimDelay = 20;
	
	initial // Response begin
	begin
		$display("\t\t xOut yOut \t XandYin XorYin \t Time");
		$monitor("\t\t %b\t %b \t %b \t %b", xOut, yOut, XandYin,XorYin, $time);
	end

	initial
	begin
					xOut = 'b00; yOut = 'b10;
		#stimDelay	xOut = 'b10;
		#stimDelay	yOut = 'b01;
		#stimDelay	xOut = 'b11;

		#(2*stimDelay);
		$finish;
	end

endmodule
