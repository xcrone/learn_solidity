// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Address {

    address public owner;
    string private location;
    
    // define contract owner
    constructor() {
        owner = msg.sender;
    }
    
    function get_balance() public view returns(uint) {
        // address(this) == address of this contract
        // replace 'this' with any address to get that address balance
        return address(this).balance;
    }
    
    // fallback payable function (another way to pay than payable) using receive
    // can only have one this function in contract
    // can't have arguments and can't return
    receive() external payable {
        location = "malaysia";
    }
    
}