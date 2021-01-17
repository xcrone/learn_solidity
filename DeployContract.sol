// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract A {
    address public ownerA;
    
    constructor(address _address) {
        ownerA = _address;
    }
}

// Creator contract can deploy many A contract
contract Creator {
    address public ownerCreator;
    address[] public deployedA;
    
    constructor() {
        ownerCreator = msg.sender;
    }
    
    function deployA() public {
        // create instance of contarct A 
        address new_A_address = address(new A(msg.sender));
        deployedA.push(new_A_address);
    }
}






