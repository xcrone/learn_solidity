// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint balance);
    function transfer(address to, uint amount) external returns (bool success);
    
    // function allowance(address account, address from) virtual external view returns (uint remaining);
    // function approve(address from, uint amount) virtual external returns (bool success);
    // function transferFrom(address from, address to, uint amount) virtual external returns (bool success);
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed account, address indexed from, uint amount);
}

contract Token is ERC20Interface {
    string public name;
    string public symbol;
    uint public decimals;
    uint public total_supply;
    address public founder;
    mapping(address => uint) private balances;
    
    modifier onlyFounder() {
        require(msg.sender == founder);
        _;
    }

    constructor(string memory _name, string memory _symbol, uint256 _decimals, uint256 _total_supply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        total_supply = _total_supply * 1000000000000000000;
        founder = msg.sender;
        balances[founder] = total_supply;
    }

    function totalSupply() override public view returns(uint) {
        return total_supply;
    }

    function balanceOf(address account) override public view returns (uint balance) {
        return balances[account];
    }

    function transfer(address to, uint amount) override public returns (bool success) {
        require(balances[msg.sender] >= amount && amount > 0);
        balances[to] += amount;
        balances[msg.sender] -= amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    
    function mint(address to, uint256 amount) public onlyFounder {
        require(total_supply < 80000 * 1000000000000000000);
        total_supply = total_supply + amount;
        balances[to] = balances[to] + amount;
        emit Transfer(msg.sender, to, amount);
    }
}









