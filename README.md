# Function_and_Error Smart Contract
This Solidity smart contract demonstrates error handling techniques using the require, assert, and revert statements. The contract allows the owner to mint and burn tokens, ensuring certain conditions are met before executing the actions.

# Getting Started
To get started with this project, follow the steps below to set up, deploy, and interact with the smart contract using the Remix IDE.

1. Setting up Remix
Open Remix IDE:
Open your web browser and navigate to Remix IDE.

2. Create a New File:
In Remix, create a new file with a .sol extension, for example, FunctionandErrors.sol.

solidity
Copy code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireAssertRevertExample {
    address public owner;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Cannot mint to the zero address");
        totalSupply += amount;
        balances[to] += amount;
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }

    function burn(uint256 amount) public onlyOwner {
        require(amount <= balances[msg.sender], "Insufficient balance to burn");
        totalSupply -= amount;
        balances[msg.sender] -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }

    function checkInvariant() public view {
        assert(totalSupply >= 0);
    }

    function forceRevert() public pure {
        revert("This function always reverts");
    }
}
# Compiling the Contract
3. Compile the Contract:
  Go to the "Solidity Compiler" tab in Remix.
  Ensure the compiler version matches pragma solidity ^0.8.0;.
  Click the "Compile RequireAssertRevertExample.sol" button.

# Deploying the Contract
4. Deploy the Contract:
  Switch to the "Deploy & run transactions" tab.
  Ensure the correct environment is selected (e.g., JavaScript VM, Injected Web3, etc.).
  Click the "Deploy" button.
# Interacting with the Smart Contract
5. Interacting with the Deployed Contract:

  After deployment, the contract will appear in the "Deployed Contracts" section.
  Expand the deployed contract to see the available functions.
# Execute Functions:

mint() Function:
   Input the address to mint tokens to and the amount of tokens to mint.
   Click the mint button.
burn() Function:
   Input the amount of tokens to burn.
   Click the burn button.
checkInvariant() Function:
   Click the checkInvariant button to assert the total supply is non-negative.
forceRevert() Function:
   Click the forceRevert button to trigger a revert.

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
