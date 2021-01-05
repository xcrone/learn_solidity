// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract readWrite {
    // public is for enabled read function
    // use private to disabled read function
    string public name = "xcrone";
    uint256 public age = 21;
    
    // public is for enabled write function
    // use private to disabled write function
    function setName(string memory _name) public returns(string memory) {
        name = _name;
        return _name;
    }
    
    function setAge(uint256 _age) public returns(uint256) {
        age = _age;
        return age;
    }
}