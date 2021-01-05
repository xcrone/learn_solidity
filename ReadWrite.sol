// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract readWrite {
    string public name = "xcrone";
    uint256 public age = 21;
    
    function setName(string memory _name) public returns(string memory) {
        name = _name;
        return _name;
    }
    
    function setAge(uint256 _age) public returns(uint256) {
        age = _age;
        return age;
    }
}