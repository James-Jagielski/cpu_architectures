# cpu_architectures
This contains RISCV processor designs extending from my undergraduate class designs


# Testing with Icarus Verilog
1. Compile the design
Use Icarus Verilog to compile your SystemVerilog files:

```iverilog -g2012 -o your_module.out hdl/your_module.sv tb/your_testbench.sv```
* -g2012 enables SystemVerilog support
* -o sim.out sets the simulation output file

2. Run the simulation
```vvp your_module.out```
* Execute your testbench
* Print any ```$display``` output
* Generate waveform files (if enabled)

3. Generate waveforms
Inside your testbench, include:

```$dumpfile("wave.vcd");```

```$dumpvars(0, tb_name);```

After running simulation, open the waveform:

```gtkwave wave.vcd```

4. Typical workflow

```iverilog -g2012 -o *.out hdl/*.sv tb/*.sv```

```vvp your_module.out```

```gtkwave wave.vcd```
