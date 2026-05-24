import subprocess
import sys
import shutil
import glob

IVERILOG = "iverilog"
VVP = "vvp"
GTKWAVE = "gtkwave"

RV32_PROGRAMS = [
    "../asm/itypes.memh",
    "../asm/ir_simple.memh",
    "../asm/irl_simple.memh",
    "../asm/irtypes.memh",
    "../asm/branch_simple.memh",
    "../asm/jump_simple.memh",
]

##############################################################################
# Common Source Groups
##############################################################################

MUX_SRCS = [
    "mux*.sv"
]

DECODER_SRCS = [
    "decoder*.sv"
]

# MUX_SRCS = [
#     "mux2.sv",
#     "mux4.sv",
#     "mux8.sv",
#     "mux16.sv",
#     "mux32.sv"
# ]

# DECODER_SRCS = [
#     "decoder_1_to_2.sv",
#     "decoder_2_to_4.sv",
#     "decoder_3_to_8.sv",
#     "decoder_4_to_16.sv",
#     "decoder_5_to_32.sv"
# ]

ADDER_SRCS = [
    "adder_1.sv",
    "adder_n.sv"
]

COMPARATOR_SRCS = [
    "comparator_eq.sv",
    "comparator_lt.sv",
    *ADDER_SRCS
]

ALU_SRCS = [
    "tests/alu_behavioural.sv",
    "adder_1.sv",
    "adder_n.sv",
    "comparator_eq.sv",
    "comparator_lt.sv",
    *MUX_SRCS,
    "shift_right.sv",
    "sll.sv",
    "alu.sv"
]

##############################################################################
# Test Database
##############################################################################

TESTS = {
    "adder1": {
        "top": "test_adder_1",
        "files": [
            "tests/test_adder_1.sv",
            "adder_1.sv"
        ]
    },

    "addern": {
        "top": "test_adder_n",
        "files": [
            "tests/test_adder_n.sv",
            "adder_1.sv",
            "adder_n.sv"
        ]
    },

    "mux": {
        "top": "test_muxes",
        "files": [
            "tests/test_muxes.sv",
            *MUX_SRCS
        ]
    },

    "decoder": {
        "top": "test_decoders",
        "files": [
            "tests/test_decoders.sv",
            *DECODER_SRCS
        ]
    },

    "comparators": {
        "top": "test_comparators",
        "files": [
            "tests/test_comparators.sv",
            *COMPARATOR_SRCS
        ]
    },

    "alu": {
        "top": "test_alu",
        "files": [
            "tests/test_alu.sv",
            *ALU_SRCS
        ]
    },

    ##########################################################################
    # Sequential Logic
    ##########################################################################

    "edge_detector": {
        "top": "test_edge_detectors",
        "files": [
            "tests/test_edge_detector.sv",
            "edge_detector.sv",
            "register.sv"
        ]
    },

    "pulse_generator": {
        "top": "test_pulse_generator",
        "files": [
            "tests/test_pulse_generator.sv",
            "pulse_generator.sv"
        ]
    },

    "triangle_generator": {
        "top": "test_triangle_generator",
        "files": [
            "tests/test_triangle_generator.sv",
            "triangle_generator.sv"
        ]
    },

    "pwm": {
        "top": "test_pwm",
        "files": [
            "tests/test_pwm.sv",
            "pulse_generator.sv",
            "pwm.sv"
        ]
    },

    ##########################################################################
    # UART
    ##########################################################################

    "uart": {
        "top": "test_uart_driver",
        "files": [
            "tests/test_uart_driver.sv",
            "tests/uart_tester.sv",
            "uart_driver.sv"
        ]
    },

    ##########################################################################
    # Register File
    ##########################################################################

    "register_file": {
        "top": "test_register_file",
        "files": [
            "tests/test_register_file.sv",
            "register_file.sv",
            "register.sv",
            *DECODER_SRCS,
            *MUX_SRCS
        ]
    },

    ##########################################################################
    # RV32I
    ##########################################################################

    "rv32_simulator": {
        "top": "rv32_simulator",
        "files": [
            "tests/rv32_simulator.sv",
            "rv32i_multicycle_core.sv",
            "rv32_common.sv",
            "register_file.sv",
            "register.sv",
            "bytewise_distributed_ram.sv",
            "tristate.sv",
            "memory_column_decoder.sv",
            "memory_write_byte_shifter.sv",
            "memory_read_byte_shifter.sv",
            *DECODER_SRCS,
            *ALU_SRCS
        ],
        "memh": RV32_PROGRAMS
    }
}

##############################################################################
# Utility Functions
##############################################################################

# def expand(files):
#     expanded = []

#     for f in files:
#         matches = glob.glob(f)

#         if matches:
#             expanded.extend(matches)
#         else:
#             expanded.append(f)

#     return expanded
def expand(files):
    expanded = []
    seen = set()

    for f in files:
        matches = glob.glob(f)
        if not matches:
            matches = [f]

        for m in matches:
            m = m.replace("\\", "/")
            if m not in seen:
                seen.add(m)
                expanded.append(m)

    return expanded

def compile_test(name):
    spec = TESTS[name]

    top = spec["top"]
    files = expand(spec["files"])

    out_file = f"{name}.out"
    vcd_file = f"{name}.vcd"

    print("=" * 60)
    print("Compiling:", name)
    print("Top module:", top)
    print("=" * 60)

    cmd = [
        IVERILOG,
        "-g2012",
        "-DSIMULATION",
        "-Wall",
        "-Wno-sensitivity-entire-vector",
        "-Wno-sensitivity-entire-array",
        "-o", out_file,
        "-s", top,
        f"-DDUMPFILE={vcd_file}"
    ] + files

    result = subprocess.run(cmd)

    if result.returncode != 0:
        print("\nCompile failed")
        sys.exit(1)

    return out_file, vcd_file


def run_test(name):
    spec = TESTS[name]

    out_file, vcd_file = compile_test(name)

    memh_list = spec.get("memh", None)

    if isinstance(memh_list, str):
        memh_list = [memh_list]

    if memh_list is None:
        memh_list = [None]

    results = []

    print("\n" + "=" * 60)
    print("RUNNING:", name)
    print("=" * 60)

    for memh in memh_list:

        label = memh if memh else "default"

        print(f"\n--- Program: {label} ---")

        cmd = [VVP, out_file]

        if memh:
            cmd.append(f"+initial_memory={memh}")

        result = subprocess.run(cmd)

        passed = (result.returncode == 0)
        results.append((label, passed))

        if passed:
            print(f"{label}: PASS")
        else:
            print(f"{label}: FAIL")

    print("\n" + "=" * 60)
    print("SUMMARY:", name)
    print("=" * 60)

    all_pass = True
    for label, passed in results:
        status = "PASS" if passed else "FAIL"
        print(f"{label:<25} {status}")
        all_pass &= passed

    print("\nFINAL RESULT:", "PASS" if all_pass else "FAIL")

    if not all_pass:
        sys.exit(1)


def run_all():
    for test in TESTS:
        print("\n")
        print("#" * 60)
        print("TEST:", test)
        print("#" * 60)

        run_test(test)


def open_wave(name):
    vcd_file = f"{name}.vcd"

    subprocess.Popen([GTKWAVE, vcd_file])


def clean():
    patterns = [
        "*.out",
        "*.vcd",
        "*.fst",
        "*.bin",
        "*.log",
        "*.jou",
        "*.xml"
    ]

    for pattern in patterns:
        for file in glob.glob(pattern):
            try:
                print("Removing:", file)
                shutil.os.remove(file)
            except:
                pass

    if shutil.os.path.exists(".Xil"):
        shutil.rmtree(".Xil")


##############################################################################
# Main
##############################################################################

if __name__ == "__main__":

    if shutil.which(IVERILOG) is None:
        print("Error: iverilog not found in PATH")
        sys.exit(1)

    if shutil.which(VVP) is None:
        print("Error: vvp not found in PATH")
        sys.exit(1)

    if len(sys.argv) < 2:
        print("Usage:")
        print("  python test.py <test>")
        print("  python test.py all")
        print("  python test.py waves <test>")
        print("  python test.py clean")
        print("")
        print("Available tests:")
        for test in TESTS:
            print(" ", test)
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "all":
        run_all()

    elif cmd == "clean":
        clean()

    elif cmd == "waves":
        if len(sys.argv) < 3:
            print("Usage: python test.py waves <test>")
            sys.exit(1)

        open_wave(sys.argv[2])

    else:
        if cmd not in TESTS:
            print("Unknown test:", cmd)
            print("Available tests:")
            for test in TESTS:
                print(" ", test)
            sys.exit(1)

        run_test(cmd)