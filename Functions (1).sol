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

    function revertExae() public pure {
        revert("This is an example of revert");
    }
}
