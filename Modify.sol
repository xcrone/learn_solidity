// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Property {
    uint public price = 90000;
    string public location = "Kajang";
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    // use modifier to easy use check owner
    // (DRY) Don't Repeat Yourself
    modifier onlyOnwer() {
        require(msg.sender == owner);
        _;
    }

    function get_balance() public view onlyOnwer returns(uint) {
        return address(this).balance;
    }

    function setPrice(uint _price) public onlyOnwer {
        require(_price > price);
        price = _price;
    }

    function setLocation(string memory _location) public onlyOnwer {
        location = _location;
    }
}










