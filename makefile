SRCS		=	$(shell find . -name "*.v" )
RSL			=	$(patsubst %.v,%.out,$(SRCS))

LOG			:=	iverilog
LOGFLAGS	:=	
ENV			:=	vvp

all: $(RSL)
	$(ENV) $(RSL)

%.out: %.v
	$(LOG)	$(LOGFLAGS) -o $@ $<

.PHONY: sim clean

sim: $(M).out
	$(ENV) $(M).out

clean:
	rm -rf *.out
