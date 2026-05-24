SHELL=/bin/bash

# ----------------------------
# Toolchain (BASE ONLY)
# ----------------------------

#IVERILOG_BASE=iverilog -g2012 -Wall -Wno-sensitivity-entire-vector -Wno-sensitivity-entire-array -y./ -y./tests -Y.sv -I./ -DSIMULATION
IVERILOG_BASE=iverilog -g2012 -Wall \-Wno-sensitivity-entire-vector \-Wno-sensitivity-entire-array \-I. -Itests \-DSIMULATION

VVP=vvp

WAVES=gtkwave --rcvar 'fontname_signals Monospace 20' --rcvar 'fontname_waves Monospace 20'


# ----------------------------
# Clean
# ----------------------------

.PHONY: clean

clean:
	rm -f *.bin *.vcd *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml *.out
	rm -rf .Xil


# ----------------------------
# Core RUN macro (IMPORTANT FIX)
# ----------------------------

#RUN = $(IVERILOG_BASE) -DDUMPFILE=\"$(TARGET).vcd\" $^ -o $@.bin && $(VVP) $@.bin
RUN = $(IVERILOG_BASE) -DDUMPFILE="$(TARGET).vcd" $^ -o $@.bin && $(VVP) $@.bin

# ============================================================
# Combinational Components
# ============================================================

test_muxes : TARGET=muxes
test_muxes : tests/test_muxes.sv mux*.sv
	$(RUN)

waves_muxes : test_muxes
	$(WAVES) muxes.vcd


test_decoders : TARGET=decoders
test_decoders : tests/test_decoders.sv decoder*.sv
	$(RUN)

waves_decoders : test_decoders
	$(WAVES) decoders.vcd


test_adder_1 : TARGET=adder_1
test_adder_1 : tests/test_adder_1.sv adder_1.sv
	$(RUN)

waves_adder_1 : test_adder_1
	$(WAVES) adder_1.vcd


test_adder_n : TARGET=adder_n
test_adder_n : tests/test_adder_n.sv adder_1.sv adder_n.sv
	$(RUN)

waves_adder_n : test_adder_n
	$(WAVES) adder_n.vcd


# ============================================================
# Shifters
# ============================================================

test_shifters : TARGET=shifters
test_shifters : tests/test_shifters.sv sll.sv sra.sv srl.sv
	$(RUN)


# ============================================================
# Comparators
# ============================================================

test_comparators : TARGET=comparators
test_comparators : tests/test_comparators.sv comparator_eq.sv comparator_lt.sv adder_1.sv
	$(RUN)

waves_comparator : test_comparators
	$(WAVES) comparators.vcd


# ============================================================
# ALU
# ============================================================

ALU_SRCS:=adder_1.sv adder_n.sv comparator_eq.sv comparator_lt.sv mux*.sv alu.sv
ALU_TEST_FILES:=tests/test_alu.sv tests/alu_behavioural.sv

test_alu : TARGET=alu
test_alu : ${ALU_TEST_FILES} ${ALU_SRCS} tests/alu_testcases.memh
	$(IVERILOG_BASE) -DDUMPFILE=\"alu.vcd\" ${ALU_TEST_FILES} ${ALU_SRCS} -o test_alu.bin && $(VVP) test_alu.bin

waves_alu : test_alu
	$(WAVES) alu.vcd


# ============================================================
# Sequential Components
# ============================================================

test_edge_detector : TARGET=edge_detector
test_edge_detector : tests/test_edge_detector.sv edge_detector.sv register.sv
	$(RUN)

waves_edge_detector : test_edge_detector
	$(WAVES) edge_detector.vcd


test_pulse_generator : TARGET=pulse_generator
test_pulse_generator : tests/test_pulse_generator.sv pulse_generator.sv
	$(RUN)

waves_pulse_generator : test_pulse_generator
	$(WAVES) pulse_generator.vcd


test_triangle_generator : TARGET=triangle_generator
test_triangle_generator : tests/test_triangle_generator.sv triangle_generator.sv
	$(RUN)

waves_triangle_generator : test_triangle_generator
	$(WAVES) triangle_generator.vcd


test_pwm : TARGET=pwm
test_pwm : tests/test_pwm.sv pulse_generator.sv pwm.sv
	@echo "This might take a while..."
	$(RUN)

waves_pwm : test_pwm
	$(WAVES) pwm.vcd


# ============================================================
# UART
# ============================================================

UART_SRCS=uart_driver.sv
UART_TEST_SRCS=tests/test_uart_driver.sv

test_uart_driver : TARGET=uart_driver
test_uart_driver : ${UART_TEST_SRCS} ${UART_SRCS}
	$(RUN)

waves_uart_driver : test_uart_driver
	$(WAVES) uart_driver.vcd


# ============================================================
# Register File
# ============================================================

RFILE_SRCS=register_file.sv register.sv $(DECODER_SRCS) $(MUX_SRCS)

test_register_file : TARGET=register_file
test_register_file : tests/test_register_file.sv ${RFILE_SRCS}
	$(RUN)

waves_register_file : test_register_file
	$(WAVES) register_file.vcd


# ============================================================
# RV32 Core
# ============================================================

RV32I_SRCS=rv32i_multicycle_core.sv rv32_common.sv ${RFILE_SRCS} ${ALU_SRCS}

%.memh : %.s ../tools/assembler.py ../tools/rv32i.py
	../tools/assembler.py $< -o $@

rv32_simulator : ${RV32I_SRCS} tests/rv32_simulator.sv
	$(IVERILOG_BASE) -y ./rv32 $^ -s $@ -o $@

test_rv32_itypes :
	./rv32_simulator +initial_memory=../asm/itypes.memh

test_rv32_irtypes :
	./rv32_simulator +initial_memory=../asm/irtypes.memh

test_rv32_ir_simple :
	./rv32_simulator +max_cycles=20 +initial_memory=../asm/ir_simple.memh

test_rv32_irl_simple :
	./rv32_simulator +max_cycles=50 +initial_memory=../asm/irl_simple.memh

test_rv32_branches :
	./rv32_simulator +max_cycles=100 +initial_memory=../asm/branch_simple.memh

test_rv32_jump :
	./rv32_simulator +max_cycles=1000 +initial_memory=../asm/jump.memh

test_rv32_sw_simple :
	./rv32_simulator +max_cycles=50 +initial_memory=../asm/sw_simple.memh

waves_rv32 : rv32_simulator
	$(WAVES) rv32_simulator.vcd