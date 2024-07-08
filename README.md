# WutherToken Smart Contract

WutherToken is a Solidity smart contract that implements a simple ERC-20-like token with minting and burning functionalities. This project demonstrates basic token management on the Ethereum blockchain.

## Description

This Solidity contract, named `WutherToken`, stores details about a custom token named "Wuther" with the abbreviation "WUWA". The contract allows for minting new tokens to increase the total supply and burning tokens to decrease the total supply. Each account's balance is tracked using a mapping. The contract includes validation and error handling using `require()`, `revert()`, and `assert()` statements to ensure robust and secure token management. Additionally, events are emitted during minting and burning for better transparency and tracking.

## Getting Started

### Executing Program

To run this program, you can use [Remix](https://remix.ethereum.org/), an online Solidity IDE.

#### Steps

1. **Open Remix**: Go to the [Remix website](https://remix.ethereum.org/).
2. **Create a New File**: Click on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `WutherToken.sol`).
3. **Copy and Paste Code**: Copy and paste the following code into the new file:

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity >=0.6.12 <0.9.0;

    contract WutherToken {

        // Public variables for token details
        string public constant tokenName = "Wuther";
        string public constant tokenSymbol = "WUWA";
        uint256 public totalSupply = 0;

        // Mapping to store balances
        mapping(address => uint256) private balances;

        // Events for minting and burning
        event Mint(address indexed to, uint256 value);
        event Burn(address indexed from, uint256 value);

        // Mint function to create new tokens
        function mint(address _to, uint256 _value) public {
            require(_to != address(0), "Invalid address");
            require(_value > 0, "Value must be greater than 0");

            totalSupply += _value;
            balances[_to] += _value;

            emit Mint(_to, _value);

            // Ensure the state changes are correct
            assert(totalSupply >= _value);
            assert(balances[_to] >= _value);
        }

        // Burn function to destroy tokens
        function burn(address _from, uint256 _value) public {
            require(_from != address(0), "Invalid address");
            require(_value > 0, "Value must be greater than 0");

            if (balances[_from] < _value) {
                revert("Insufficient balance to burn");
            }

            totalSupply -= _value;
            balances[_from] -= _value;

            emit Burn(_from, _value);

            // Ensure the state changes are correct
            assert(totalSupply >= 0);
            assert(balances[_from] >= 0);
        }

        // Function to check the balance of an address
        function balanceOf(address _owner) public view returns (uint256) {
            return balances[_owner];
        }
    }
    ```

4. **Compile the Code**:
    - Click on the "Solidity Compiler" tab in the left-hand sidebar.
    - Make sure the "Compiler" option is set to a compatible version (e.g., `0.6.12` to `0.9.0`).
    - Click on the "Compile WutherToken.sol" button.

5. **Deploy the Contract**:
    - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
    - Select the "WutherToken" contract from the dropdown menu.
    - Click on the "Deploy" button.

6. **Interact with the Contract**:
    - After deployment, click on the "WutherToken" contract in the left-hand sidebar.
    - You can now call the `mint` and `burn` functions to manage the token supply.
        - **Mint Tokens**: Call `mint(address _to, uint256 _value)` with the desired address and token amount.
        - **Burn Tokens**: Call `burn(address _from, uint256 _value)` with the desired address and token amount (ensure the address has enough tokens to burn).

## Features

- **Token Details**: Public variables for token name, symbol, and total supply.
- **Minting**: Function to mint new tokens, increasing total supply and the balance of the specified address. Emits a `Mint` event.
- **Burning**: Function to burn tokens, decreasing total supply and the balance of the specified address, with balance checks. Emits a `Burn` event.
- **Error Handling**: Uses `require()`, `revert()`, and `assert()` to ensure valid operations and contract correctness.
- **Balance Check**: Function to check the token balance of a specified address.

## Authors

- **Bryce Angeles**
    - Twitter: [@Mhistwy](https://twitter.com/nchlsangls)

