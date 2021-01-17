// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract FundRaising {
    mapping(address => uint) public contributors;
    address public admin;
    uint public noOfContributors;
    uint public minimumContribution;
    uint public deadline; // timestamp (seconds) <Use block.number instead of block.timestamp>
    uint public goal;
    uint public raisedAmount = 0;
    
    constructor(uint _goal, uint _deadline) {
        goal = _goal;
        deadline = block.timestamp + _deadline;
        admin = msg.sender;
        minimumContribution = 10;
    }
    
    function contribute() public payable {
        require(block.timestamp < deadline);
        require(msg.value >= minimumContribution);
        if(contributors[msg.sender] == 0) {
            noOfContributors++;
        }
        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function getRefund() public {
        require(block.timestamp > deadline);
        require(raisedAmount < goal);
        require(contributors[msg.sender] > 0);
        address recipient = msg.sender;
        uint value = contributors[msg.sender];
        payable(recipient).transfer(value);
        contributors[msg.sender] = 0;
    }
    
}






