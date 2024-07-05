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
        // Validation using require
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
        // Validation using require
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
