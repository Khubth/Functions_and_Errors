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
        uint previousCount = students[msg.sender].attendanceCount;
        students[msg.sender].attendanceCount++;
        assert(students[msg.sender].attendanceCount > previousCount);
    }

    function checkEligibility(address _studentAddress) public view returns (bool) {
        require(isStudent[_studentAddress], "Invalid student");
        return students[_studentAddress].attendanceCount >= requiredAttendance;
    }

    function updateRequiredAttendance(uint _newRequiredAttendance) public onlyOwner {
        require(_newRequiredAttendance > 0, "Required attendance must be greater than zero");
        requiredAttendance = _newRequiredAttendance;
    }

    function resetAttendance(address _studentAddress) public onlyOwner {
        require(isStudent[_studentAddress], "Invalid student");
        uint previousCount = students[_studentAddress].attendanceCount;
        students[_studentAddress].attendanceCount = 0;
        assert(students[_studentAddress].attendanceCount == 0 && previousCount > 0);
    }

    function revertExample(uint attendance) public view {
        if (attendance < requiredAttendance) {
            revert("Attendance is below the required threshold");
        }
    }
}

