# SPI Controller (SystemVerilog)

## Project Description

This repository contains the RTL implementation of an **SPI (Serial Peripheral Interface) controller** written in **SystemVerilog**.
The module is designed for ASIC/FPGA integration and supports standard SPI communication between a master and slave device.

## Features

* Configurable clock polarity (CPOL) and phase (CPHA)
* Supports SPI master mode
* Parameterized data width
* Synthesizable SystemVerilog design
* Testbench for functional verification

## Repository Structure

```
rtl/        -> SPI controller RTL code
tb/         -> Testbench files
scripts/    -> Simulation scripts
docs/       -> Design documentation
```

## Setup Instructions

1. Clone the repository:

```
git clone https://github.com/your-org/rtl_spi_controller_sv.git
```

2. Navigate to the project directory:

```
cd rtl_spi_controller_sv
```

3. Run simulation using your preferred simulator (e.g., VCS, QuestaSim).

## Usage Example

Instantiate the SPI controller module in your top-level design:

```
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
```

## Contribution Guidelines

* Fork the repository
* Create a feature branch
* Commit your changes with clear messages
* Submit a pull request for review

## License

This project is licensed under the **MIT License**.
