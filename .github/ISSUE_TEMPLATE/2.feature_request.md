---
name: RTL / Verification Feature Request
about: Suggest a new RTL feature, verification improvement, or enhancement
title: "feat: "
labels: ["enhancement"]
assignees: ""
---

# Feature Request

## Feature Description

<!-- Clearly describe the proposed feature or improvement -->

Example:
- Add support for **multiple SPI modes (Mode 0–3)**
- Implement **parameterized data width**
- Add **clock divider for configurable SPI clock**
- Improve verification with **additional test scenarios**

---

## Problem Statement

<!-- Explain the problem this feature would solve -->

Example:
Currently the SPI controller supports only **fixed 8-bit transfers and Mode-0**, which limits flexibility when interfacing with different SPI peripherals.

---

## Proposed Solution

<!-- Describe how the feature should work -->

Example:
- Add configuration parameters for **CPOL and CPHA**
- Implement **configurable data width**
- Update FSM logic to support these configurations
- Extend the testbench to verify multiple configurations

---

## Alternative Solutions

<!-- Describe any alternative approaches considered -->

Example:
- Implement separate modules for each SPI mode
- Provide configuration through parameters instead of runtime signals

---

## Project / Module
<!-- Specify the module where the issue occurred -->
Example: `rtl/spi_master.v`, `tb/spi_master_tb.v`

---

## Related RTL / Verification Code

<!-- Provide example RTL or testbench snippets if applicable -->

```verilog
// Example parameterization idea
parameter DATA_WIDTH = 8;
````

---

## Verification Impact

<!-- Describe how this feature should be verified -->

Example:

* Add new **test cases in the testbench**
* Verify behavior for all **SPI modes**
* Capture waveform results to confirm correct timing
* Validate MOSI/MISO data integrity

---

## Additional Context

<!-- Any additional information -->

* Related issues
* Design references
* Protocol documentation
* Simulation waveforms or diagrams

---

## Contribution

If this feature request is approved, would you be willing to submit a PR?

**Yes / No**

*(Help can be provided if assistance is needed for submitting a PR.)*


