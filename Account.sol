// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Account {
    uint public value;

    function msgSender() public view returns(address) {
        // msg.sender show account that generate the transaction/function
        return msg.sender;
    }
    
    // send wei
    function msgValue() payable public {
        // msg.value is wei value that sent from account
        value = msg.value;
    }
    
    function msgGas() public view returns(uint) {
        // msg.gas show the remaining gas of transaction
        // msg.gas will be replaced with gasleft()
        return gasleft();
    }
    
    // TODO: msg.data => need more research
    
}