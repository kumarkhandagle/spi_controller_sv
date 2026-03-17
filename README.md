<p align="center">
  <a href="https://github.com/dec0dOS/amazing-github-template">
    <img src="https://github.com/user-attachments/assets/dd249178-b027-42d9-a126-f2b7757d7fa3" width="500">
  </a>
</p>

<h1 align="center">SPI Master Controller RTL</h1>

<p align="center">
RTL Design and Verification project for an SPI Master Controller implemented in Verilog.
</p>

<p align="center">
<a href="../../issues/new?template=bug_report.md">Report a Bug</a> ·
<a href="../../issues/new?template=feature_request.md">Request a Feature</a> ·
</p>

<p align="center">
<img src="https://img.shields.io/badge/license-MIT-green">
<img src="https://img.shields.io/badge/PRs-welcome-brightgreen">
<img src="https://img.shields.io/badge/RTL-Verilog-blue">
</p>


# SPI Controller (SystemVerilog)

<details open>
<summary><b>Table of Contents</b></summary>

- [Project Description](#project-description)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Setup Instructions](#setup-instructions)
- [Usage Example](#usage-example)
- [Contribution Guidelines](#contribution-guidelines)
- [License](#license)

</details>

---

## Project Description

This repository contains the RTL implementation of an **SPI (Serial Peripheral Interface) controller** written in **SystemVerilog**.  
The module is designed for **ASIC/FPGA integration** and supports standard SPI communication between a **master and slave device**.

---

## Features

- Configurable clock polarity (**CPOL**) and phase (**CPHA**)  
- Supports **SPI master mode**  
- **Parameterized data width** for flexible configurations  
- **Synthesizable SystemVerilog RTL design**  
- Includes a **testbench for functional verification**

---

## Repository Structure

```

rtl/        -> SPI controller RTL code
tb/         -> Testbench files
scripts/    -> Simulation scripts
docs/       -> Design documentation

```

---

## Setup Instructions

### 1. Clone the repository

```

git clone [https://github.com/your-org/rtl_spi_controller_sv.git](https://github.com/your-org/rtl_spi_controller_sv.git)

```

### 2. Navigate to the project directory

```

cd rtl_spi_controller_sv

```

### 3. Run simulation

Run simulation using your preferred simulator such as:

- VCS  
- QuestaSim  
- ModelSim  
- Xcelium  

Example:

```

cd scripts
./run_sim.sh

````

---

## Usage Example

Instantiate the SPI controller module in your top-level design:

```systemverilog
spi_controller #(
  .DATA_WIDTH(8)
) spi_inst (
  .clk(clk),
  .rst_n(rst_n),
  .mosi(mosi),
  .miso(miso),
  .sclk(sclk),
  .cs(cs)
);
````

---

## Contribution Guidelines

Contributions are welcome.

1. Fork the repository
2. Create a new feature branch

```
git checkout -b feature/your-feature-name
```

3. Commit your changes with clear commit messages
4. Push the branch and open a **Pull Request**

---

## License

This project is licensed under the **MIT License**.



