<!-- Please provide a short summary of the RTL/verification change in the title -->

# Pull Request

## Pull Request Type

<!-- Try to keep the PR focused on one category -->

Please check the type of change your PR introduces:

- [ ] RTL Bug Fix
- [ ] New RTL Feature
- [ ] Verification / Testbench Improvement
- [ ] Simulation Testcase Addition
- [ ] Code style / formatting update
- [ ] RTL Refactoring (no functional change)
- [ ] Documentation update
- [ ] Build / CI related changes
- [ ] Other (please describe):

---

## Module(s) Affected

<!-- List RTL modules or verification files modified -->

Example:
- `spi_master.v`
- `spi_master_tb.v`

---

## Current Behavior

<!-- Describe the current behavior or limitation -->

Example:
- SPI controller only supports **Mode-0**
- `done` signal is not asserted after the final bit transfer

Related Issue: #

---

## New Behavior

<!-- Describe what this PR changes or fixes -->

Example:

- Added support for **parameterized data width**
- Fixed incorrect **MOSI bit shifting**
- Added additional **testbench stimulus cases**
- Updated FSM transitions

---

## Verification

<!-- Explain how the changes were verified -->

- [ ] RTL simulation completed
- [ ] Waveforms checked
- [ ] Existing testbench passes
- [ ] New testcases added

Simulator used:

- ModelSim / QuestaSim / VCS / Icarus Verilog

---

## Waveforms / Logs

<!-- Attach waveform screenshots or simulation logs if available -->

Example:
- GTKWave screenshot
- ModelSim transcript

---

## Additional Notes

<!-- Any extra information useful for reviewers -->

Example:
- Timing impact
- Protocol compliance references
- Design tradeoffs