---
name: RTL / Verification Bug Report
about: Report an issue related to RTL design or verification codes
title: "bug: "
labels: "bug"
assignees: ""
---

# Bug Report

## Project / Module
<!-- Specify the module where the issue occurred -->
Example: `rtl/spi_master.v`, `tb/spi_master_tb.v`

---

## RTL / Testbench Version
<!-- Specify commit hash, branch name, or release version -->

---

## Current Behavior
<!-- Describe the observed incorrect behavior -->
Example:
- Incorrect data captured on `MISO`
- `SCLK` not toggling as expected
- Simulation mismatch between expected and actual output
- FSM stuck in a state

---

## Expected Behavior
<!-- Describe what the correct behavior should be -->

Example:
- Data should be transmitted correctly over MOSI
- SPI transaction should complete after 8 clock cycles
- FSM should transition from `IDLE → LOAD → TRANSFER → DONE`

---

## Steps to Reproduce

1. Run simulation using the provided testbench  
2. Apply the following stimulus  
3. Observe waveform behavior in the simulator  

Example:
- Reset the SPI controller
- Assert start signal
- Provide input data = 8'b10101010
- Observe MOSI/SCLK waveform


---

## Simulation Environment

<!-- Provide simulator and tool information -->

- Simulator: (ModelSim / QuestaSim / VCS / Icarus Verilog / Xcelium)
- OS: (Linux / Windows / Mac)
- Tool Version: Vivado 2025.1
---

## Related Code

<!-- Provide relevant RTL or testbench snippets -->

```verilog
// Insert RTL or testbench snippet related to the issue

```
---
## Additional Context
<!-- Any additional information that may help diagnose the issue -->

- Possible root cause
- Suggested fixes
- Reference documentation

