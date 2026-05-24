import subprocess
import sys
import shutil
import glob

IVERILOG = "iverilog"
VVP = "vvp"


TESTS = {
    "adder1": {
        "top": "test_adder_1",
        "files": ["tests/test_adder_1.sv", "adder_1.sv"]
    },
    "addern": {
        "top": "test_adder_n",
        "files": ["tests/test_adder_n.sv", "adder_1.sv", "adder_n.sv"]
    },
    "mux": {
        "top": "test_muxes",
        "files": ["tests/test_muxes.sv", "mux*.sv"]
    },
    "decoder": {
        "top": "test_decoders",
        "files": ["tests/test_decoders.sv", "decoder*.sv"]
    },
    "comparators": {
        "top": "test_comparators",
        "files": ["tests/test_comparators.sv", "comparator_eq.sv", "comparator_lt.sv", "adder_1.sv"]
    },
    "alu": {
        "top": "test_alu",
        "files": [
            "tests/test_alu.sv",
            "tests/alu_behavioural.sv",
            "adder_1.sv",
            "adder_n.sv",
            "comparator_eq.sv",
            "comparator_lt.sv",
            "mux*.sv",
            "alu.sv"
        ]
    }
}


def expand(files):
    out = []
    for f in files:
        matches = glob.glob(f)
        if matches:
            out.extend(matches)
        else:
            out.append(f)
    return out


def run(name):
    if name not in TESTS:
        print("Unknown test:", name)
        print("Available:", list(TESTS.keys()))
        sys.exit(1)

    spec = TESTS[name]

    top = spec["top"]
    files = expand(spec["files"])

    out_file = f"{name}.out"
    vcd_file = f"{name}.vcd"

    print("Compiling:", name)
    print("Top module:", top)

    cmd = [
        IVERILOG,
        "-g2012",
        "-o", out_file,
        f"-DDUMPFILE={vcd_file}",
        "-s", top
    ] + files

    result = subprocess.run(cmd)
    if result.returncode != 0:
        print("Compile failed")
        sys.exit(1)

    result = subprocess.run([VVP, out_file])
    if result.returncode != 0:
        print("Simulation failed")
        sys.exit(1)

    print("Done:", vcd_file)


if __name__ == "__main__":
    if shutil.which(IVERILOG) is None:
        print("Error: iverilog not found in PATH")
        sys.exit(1)

    if shutil.which(VVP) is None:
        print("Error: vvp not found in PATH")
        sys.exit(1)

    if len(sys.argv) < 2:
        print("Usage: python test.py <test>")
        print("Tests:", list(TESTS.keys()))
        sys.exit(1)

    run(sys.argv[1])