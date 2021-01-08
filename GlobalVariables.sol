// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract GlobalVariables {

    // get current timestamp in unix epoch
    uint public block_timestamp = block.timestamp;

    // get block number
    uint public block_number = block.number;

    // get block difficulty
    uint public block_difficulty = block.difficulty;

    // get gas limit
    uint public block_gaslimit = block.gaslimit;

    // get gas price of the transaction
    function tx_gasprice() public view returns(uint) {
        return tx.gasprice;
    }
    
}