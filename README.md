# Zero Knowledge Circuit Library

This is a work in progress. Last updated in November 2021.

## Instructions

Before running, make sure you have **Circom 2.0** installed on your machine. Check the [official documentation](https://docs.circom.io/getting-started/installation/) for installation.

To run a circuit, `cd` into `circuits/<circuit-name>` directory, edit `input.json` for your desired input, and run
```
sh ../../run.sh -c <circuit-name> -n <your-name>
```
If the proof is valid, the log should not include any errors and should end with "[INFO] snarkJS: Ok!".

To create a new circuit, create a directory named `<circuit-name>` in `circuits` folder, and create two files: `<circuit-name>.circom` and `input.json`. Check the Circom documentation for more details. You can then run your circuits as specifed above.
