// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

/*
PUBLIC
    - can be access by user, within and another contract
PRIVATE
    - cannot be access by user and can only be access within contract
INTERNAL
    - cannot be called by user but can be called by derived/inheritance contract
EXTERNAL
    - can be access by user and another contract
*/

contract A {
    int x = 8;
    
    function f_a() public view returns(int) {
        return x;
    }
    
    // private can be called only within this contract, not by user
    function f_b() private view returns(int) {
        return x;
    }
    
    // function that call private variable or function to public
    function f_c() public view returns(int) {
        int c;
        c = f_b();
        return c;
    }
    
    // internal function
    function f_d() internal view returns(int) {
        return x;
    }
    
    // external function
    function f_e() external view returns(int) {
        return x;
    }
}

// contract B derived by contract A (derived is like inheritance)
contract B is A {
    int public xx = f_d();
}

// contract C will deploy contract A
contract C {
    // get contract A
    A public contract_a = new A();
    
    // call function from contract A
    int public xx = contract_a.f_a();
    // int public yy = contract_a.f_b(); // Error: f_b() is private function
    int public yy = contract_a.f_c();
}