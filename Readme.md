# Foundry PoC Template

## Introduction
This is a foundry template for quick and easy Proof of Concept (PoC) fork tests. It is intended to be used as a starting point for writing PoCs tests for vulnerabilities on any EVM compatible network. It is not intended to be used as a final PoC.

## Requirements

*Foundry* is required to use this template. Installation instructions can be found [here](https://book.getfoundry.sh/getting-started/installation).

## Usage

1. Clone the repository
2. Run `forge install` to download the dependencies
3. Run `cp .env.example .env` and fill in the required values
4. Save your interfaces and custom contracts at `src/`
5. Write your PoC tests at `test/`, using the `test/TestPoc1.sol` as a template, and run `forge test` to run them. Note it is recommended to use a file per PoC test, and name it `TestPocX.sol` where X is the number of the PoC test.

Happy hacking anon!


