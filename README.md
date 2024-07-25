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

contract CollegeAttendance {
    struct Student {
        string name;
        uint attendanceCount;
    }

    address public owner;
    uint public requiredAttendance;
    mapping(address => Student) public students;
    mapping(address => bool) public isStudent;

    constructor(uint _requiredAttendance) {
        owner = msg.sender;
        requiredAttendance = _requiredAttendance;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier onlyStudent() {
        require(isStudent[msg.sender], "Only students can perform this action");
        _;
    }

    function addStudent(address _studentAddress, string memory _name) public onlyOwner {
        require(!isStudent[_studentAddress], "Student already exists");
        students[_studentAddress] = Student(_name, 0);
        isStudent[_studentAddress] = true;
    }

    function markAttendance() public onlyStudent {
        students[msg.sender].attendanceCount++;
    }

    function checkEligibility(address _studentAddress) public view returns (bool) {
        require(isStudent[_studentAddress], "Invalid student");
        return students[_studentAddress].attendanceCount >= requiredAttendance;
    }

    function updateRequiredAttendance(uint _newRequiredAttendance) public onlyOwner {
        require(_newRequiredAttendance > 0, "Required attendance must be greater than zero");
        requiredAttendance = _newRequiredAttendance;
    }

    function revertExample() public pure {
        revert("This is an example of revert");
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

 1. addStudent Function: Adds a student if they don't already exist.
 2. markAttendance Function: Allows a student to mark their attendance.
 3. checkEligibility Function: Checks if a student's attendance meets the required threshold.
 4. updateRequiredAttendance Function: Updates the required attendance (only by the owner).
 5. revertExae Function: Demonstrates a revert with a custom error message

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
