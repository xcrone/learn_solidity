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
}