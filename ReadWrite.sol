// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract readWrite {
    // public is for enabled read function
    // use private to disabled read function
    string public name = "xcrone";
    uint256 public age = 21;
    string[2] public group; // fixed array // array index count is set to 2
    uint[] public price; // dynamic array // can push unlimited index
    
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

    function setGroup(uint index, string memory value) public {
        group[index] = value;
    }

    function addPrice(uint _price) public {
        price.push(_price);
    }

    // read price length
    function getPriceLength() view returns(uint) {
        return price.length;
    }

    // delete element from dynamic array
    function deletePriceElement(uint index) public returns(bool) {
        // check if index is defined
        if(index >= price.length) {
            return false;
        }
        // reset array index value start from index input
        for(uint i = index; i < price.length - 1; i++) {
            price[i] = price[i+1];
        }
        // remove/resize the remaining index
        price.pop();
        return true;
    } 
}