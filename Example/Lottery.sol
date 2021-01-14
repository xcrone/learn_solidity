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
    
    function randMod() public view returns(uint256) { 
        // random number
        // 3 parameter in encodePacked is any uint value to make it random
        return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, players.length)));
    } 
    
    function selectWinner() public {
        require(msg.sender == manager);
        
        // get winner address
        uint r = randMod(); // should be random number
        uint index = r % players.length;
        address winner;
        winner = players[index];
        
        // change winner address from datatype "address" to datatype "address payable"
        rewardsWinner(payable(winner), address(this).balance);
    }
    
    function rewardsWinner(address payable winner, uint256 amount) private {
        // transfer
        winner.transfer(amount);
    }
}












