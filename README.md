# Function_and_Error Smart Contract
This Solidity smart contract demonstrates error handling techniques using the require, assert, and revert statements. The contract allows the owner to mint and burn tokens, ensuring certain conditions are met before executing the actions.

# Getting Started
To get started with this project, follow the steps below to set up, deploy, and interact with the smart contract using the Remix IDE.

1. Setting up Remix
Open Remix IDE:
Open your web browser and navigate to Remix IDE.

2. Create a New File:
In Remix, create a new file with a .sol extension, for example, FunctionandErrors.sol.

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
# Compiling the Contract
3. Compile the Contract:
   1. Go to the "Solidity Compiler" tab in Remix.
   2. Ensure the compiler version matches pragma solidity ^0.8.0;.
   3. Click the "Compile RequireAssertRevertExample.sol" button.

# Deploying the Contract
4. Deploy the Contract:
  1. Switch to the "Deploy & run transactions" tab.
  2. Ensure the correct environment is selected (e.g., JavaScript VM, Injected Web3, etc.).
  3. Click the "Deploy" button.

# Interacting with the Smart Contract
5. Interacting with the Deployed Contract:

  1.  After deployment, the contract will appear in the "Deployed Contracts" section.
  2. Expand the deployed contract to see the available functions.

# Execute Functions:

 1. Set Amount Function: Input the amount to set. Click the setAmount button.
 2. Set Amount with Revert Function: Input the amount to set. Click the setAmountWithRevert button.
 3. Set Even Value Function: Input the amount to set. Click the setEvenValue button.
 4. Set Amount Positive Function: Input the amount to set. Click the setAmountPositive button.

# Error Handling Overview
require():
  Used to validate input conditions or contract preconditions. If the condition is not met, it 
  throws an error and reverts the transaction.
assert():
  Used to check for internal errors. It should only be used for conditions that should never be 
  false. If the condition is false, it indicates a bug in the contract.
revert():
  Explicitly reverts the transaction, usually due to a requirement violation or an exceptional 
  condition.
These error-handling mechanisms help ensure the contract's integrity and provide meaningful feedback to users interacting with the contract.

# Author
Khushi Ranjana
