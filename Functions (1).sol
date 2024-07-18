// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContract {
    uint public amount;

    // Function with require statement
    function setAmount(uint _amount) public {
        require(_amount > 5, "Amount must be greater than five");
        assert(_amount != 25);
        amount = _amount;
    }

    // Function with revert statement
    function setAmountWithRevert(uint _amount) public {
        if (_amount == 1) {
            revert("Value cannot be One");
        }
        amount = _amount;
    }

    // Function with require statement that checks for even number
    function setEvenValue(uint _amount) public {
        require(_amount % 2 == 0, "Amount must be even");
        assert(_amount!= 25);
        amount = _amount;
    }

    // Function with revert statement if value is negative
    function setAmountPositive(uint _amount) public {
        if (_amount < 0) {
            revert("Value must be non-negative");
        }
        amount = _amount;
    }
}
