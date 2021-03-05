`include "andOr0.v"

module testBench;

	wire [1:0]	X,Y;
	wire [1:0]	XandY, XorY;

	AndOr	myAndOr(XandY[1:0], XorY[1:0], X[1:0], Y[1:0]);

	Tester	aTester(X[1:0], Y[1:0], XandY[1:0], XorY[1:0]);


	initial
	begin
		$dumpfile ("andor0.vcd");
		$dumpvars (1,myAndOr);
	end
endmodule
