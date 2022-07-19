# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
WIDTH ?=32
VERILOG_SOURCES += $(PWD)/shift_register.v

# use VHDL_SOURCES for VHDL files
WAVES ?= 1
# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = shift_register
# MODULE is the basename of the Python test file

# PWD=$(shell pwd)/src
MODULE = shift_register_test

# COMPILE_ARGS+=-Pshift_register.WIDTH=$(WIDTH)
# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

clean::
	rm -r  __pycache__ results.xml