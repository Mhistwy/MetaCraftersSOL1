# MyToken Smart Contract

MyToken is a Solidity smart contract that implements a simple ERC-20-like token with minting and burning functionalities. This project demonstrates basic token management on the Ethereum blockchain.

## Description

This Solidity contract, named `MyToken`, stores details about a custom token named "Meta" with the abbreviation "MTA". The contract allows for minting new tokens to increase the total supply and burning tokens to decrease the total supply. Each account's balance is tracked using a mapping. The contract includes validation and error handling using `require()`, `revert()`, and `assert()` statements to ensure robust and secure token management.

## Getting Started

### Executing Program

To run this program, you can use [Remix](https://remix.ethereum.org/), an online Solidity IDE.

#### Steps

1. **Open Remix**: Go to the [Remix website](https://remix.ethereum.org/).
2. **Create a New File**: Click on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `MyToken.sol`).
3. **Copy and Paste Code**: Copy and paste the following code into the new file:

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity >=0.6.12 <0.9.0;

    contract MyToken {

        // Public variables
        string public tokenName = "Meta";
        string public tokenAbb = "MTA";
        uint public totalSup = 0;

        // Mapping to store balances
        mapping(address => uint) public balances;

        // Mint function to create new tokens
        function mint(address _address, uint _value) public {
            require(_address != address(0), "Invalid address");
            require(_value > 0, "Value must be greater than 0");
            
            totalSup += _value;
            balances[_address] += _value;

            // Assert statements to ensure correct state changes
            assert(totalSup >= _value);
            assert(balances[_address] >= _value);
        }

        // Burn function to destroy tokens
        function burn(address _address, uint _value) public {
            require(_address != address(0), "Invalid address");
            require(_value > 0, "Value must be greater than 0");
            
            // Validation using revert for custom error messages
            if (balances[_address] < _value) {
                revert("Insufficient balance to burn");
            }

            totalSup -= _value;
            balances[_address] -= _value;

            // Assert statements to ensure correct state changes
            assert(totalSup >= 0);
            assert(balances[_address] >= 0);
        }
    }
    ```

4. **Compile the Code**:
    - Click on the "Solidity Compiler" tab in the left-hand sidebar.
    - Make sure the "Compiler" option is set to a compatible version (e.g., `0.6.12` to `0.9.0`).
    - Click on the "Compile MyToken.sol" button.

5. **Deploy the Contract**:
    - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
    - Select the "MyToken" contract from the dropdown menu.
    - Click on the "Deploy" button.

6. **Interact with the Contract**:
    - After deployment, click on the "MyToken" contract in the left-hand sidebar.
    - You can now call the `mint` and `burn` functions to manage the token supply.
        - **Mint Tokens**: Call `mint(address _address, uint _value)` with the desired address and token amount.
        - **Burn Tokens**: Call `burn(address _address, uint _value)` with the desired address and token amount (ensure the address has enough tokens to burn).

## Features

- **Token Details**: Public variables for token name, abbreviation, and total supply.
- **Minting**: Function to mint new tokens, increasing total supply and the balance of the specified address.
- **Burning**: Function to burn tokens, decreasing total supply and the balance of the specified address, with balance checks.
- **Error Handling**: Uses `require()`, `revert()`, and `assert()` to ensure valid operations and contract correctness.

## Authors

- **Your Name**
    - Twitter: [@Mhistwy](https://twitter.com/nchlsangls)
