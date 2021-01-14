// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Lottery {
    address[] public players;
    address public manager;
    
    constructor() {
        manager = msg.sender;
    }
    
    receive() payable external {
        require(msg.value >= 0.01 ether); // If true, push. If false, throw
        // push array;
        players.push(msg.sender);
    }
    
    function get_balance() public view returns(uint) {
        require(msg.sender == manager); // only manager can view balance
        return address(this).balance;
    }
}