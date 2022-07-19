#!/usr/bin/env python
import random
import cocotb
from cocotb.triggers import Timer
from cocotb.clock import Clock


@cocotb.test()
async def shift_register_test(dut):
    # shift register has q,clk as inputs and 32 bit output
    # create clk
    clk = cocotb.fork(Clock(dut.clk, 10, units='ns').start())
    # create input
    dut.d.value = 1
    start = 0x00000001
    for i in range(100):

        await Timer(10, units='ns')

        cocotb.log.info(
            f"dut.out.value = {bin(dut.out.value)[2:]} it is {bin(start)[2:]}")
        # the value dut.out.value is in th form of 32 bits
        assert bin(dut.out.value)[2:] == bin(start)[2:]
        f"shift register output is not correct {bin(dut.out.value)[2:]} not matching with {bin(start)[2:]}"
        start = (start << 1) + 1
    clk.close()
