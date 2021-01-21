// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

abstract contract ERC20Interface {
    function totalSupply() virtual public view returns (uint);
    function balanceOf(address tokenOwner) virtual public view returns (uint balance);
    function transfer(address to, uint amount) virtual public returns (bool success);
    
    function allowance(address tokenOwner, address from) virtual external view returns (uint remaining);
    function approve(address from, uint amount) virtual external returns (bool success);
    function transferFrom(address from, address to, uint amount) virtual external returns (bool success);
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed tokenOwner, address indexed from, uint amount);
}

abstract contract Cryptos is ERC20Interface {
    string public name = "My Finance";
    string public symbol = "MYFI";
    uint public decimals = 8;
    
    uint public supply;
    address public founder;
    
    mapping(address => uint) public balances;
}