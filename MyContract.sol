// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// MyContract is a simple smart contract demonstrating the use of `require()`, `assert()`, and `revert()` statements.
contract MyContract {
    // The owner of the contract
    address public owner;
    
    // The value stored in the contract
    uint256 public value;
    
    // Constructor sets the deployer as the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict functions to only the owner
    modifier onlyOwner() {
        // require() checks if the caller is the owner, reverts if not
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Function to set the value, only callable by the owner
    function setValue(uint256 _value) public onlyOwner {
        // Use require to validate input: the value must be greater than zero
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    // Function to decrement the value by one, only callable by the owner
    function decrementValue() public onlyOwner {
        // Use assert to check for a condition that should never be false: value must be greater than zero
        assert(value > 0);
        value -= 1;
    }

    // Function to reset the value to zero, only callable by the owner
    function resetValue() public onlyOwner {
        // Use revert to handle an error condition explicitly: if value is already zero
        if (value == 0) {
            revert("Value is already zero");
        }
        value = 0;
    }
}
