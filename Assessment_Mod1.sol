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
