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
    function getPriceLength() public view returns(uint) {
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
    
    // =============== STRUCT ===============
    // struct is a collection similar to mapping
    // declare a new datatype with struct
    struct Car {
        string description;
        uint value;
        uint built_year;
    }
    // declare a new variable with datatype Car
    Car public tesla;
    mapping(address => Car) public cars;
    
    constructor(string memory _description, uint _value, uint _built_year) {
        tesla.description = _description;
        tesla.value = _value;
        tesla.built_year = _built_year;
        
        // msg.sender is the address of account that deploys the contract
        cars[msg.sender] = tesla;
    }

    // modify struct variable
    function modify_car(string memory _description, uint _value, uint _built_year) public returns(bool) {
        if(status == State.running) {
            Car memory newTesla = Car({
                description: _description,
                value: _value,
                built_year: _built_year
            });
            tesla = newTesla;
            return true;
        }else {
            return false;
        }
    }
}