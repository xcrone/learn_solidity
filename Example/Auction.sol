// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Auction {
    address public owner;
    uint public startBlock;
    uint public endBlock;
    // IPFS is a cost-effective and scalable off-chain decentralized solution for saving data
    string public ipfsHash;
    
    enum State {Started, Running, Ended, Canceled}
    State public auction_state;
    
    uint public highestBindingBid;
    address public highestBidder;
    
    mapping(address => uint) public bids;
    
    uint bidIncrement;
    
    // constructor(uint _startBlock, uint _endBlock, string memory _ipfsHash, uint _bidIncrement) {
    //     owner = msg.sender;
    //     auction_state = State.Running;
    //     startBlock = _startBlock;
    //     endBlock = _endBlock;
    //     ipfsHash = _ipfsHash;
    //     bidIncrement = _bidIncrement;
    // }
    
    constructor() {
        owner = msg.sender;
        auction_state = State.Running;
        startBlock = block.number;
        // 604800 second == a week
        // 604800/15 = 40320 (15 is ethereum blocktime)
        endBlock = startBlock + 40320; // this auction will be in running state for a week.
        ipfsHash = "";
        bidIncrement = 10;
    }
    
    modifier notOwner() {
        require(msg.sender != owner);
        _;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier afterStart() {
        require(block.number >= startBlock);
        _;
    }
    
    modifier beforeEnd() {
        require(block.number <= endBlock);
        _;
    }
    
    function min(uint a, uint b) pure internal returns(uint) {
        if(a <= b) {
            return a;
        }else {
            return b;
        }
    }
    
    function cancelAuction() public onlyOwner {
        auction_state = State.Canceled;
    }
    
    function placeBid() public payable notOwner afterStart beforeEnd returns(bool) {
        require(auction_state == State.Running);
        // require(msg.value > 0.001 ether);
        
        // if bids[msg.sender] not found, it will be 0
        uint currentBid = bids[msg.sender] + msg.value;
        
        require(currentBid > highestBindingBid);
        bids[msg.sender] = currentBid;
        
        if(currentBid <= bids[highestBidder]) {
            highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]); 
        }else {
            highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = msg.sender;
        }
        
        return true;
    }
    
    // this function will finalize auction if state is canceled or bidders that sent ether
    function finalizeAuction() public {
        require(auction_state == State.Canceled || block.number > endBlock); // if the auction ended
        require(msg.sender == owner || bids[msg.sender] > 0); // if the bidder is already bids
        address recipient;
        uint value;
        if(auction_state == State.Canceled) {
            recipient = msg.sender;
            value = bids[msg.sender];
        }else {
            // if owner
            if(msg.sender == owner) {
                recipient = owner;
                value = highestBindingBid;
            }else { // if bidder request fund
                // if the highest bidder
                if(msg.sender == highestBidder) {
                    recipient = highestBidder;
                    value = bids[highestBidder] - highestBindingBid;
                }else {
                    recipient = msg.sender;
                    value = bids[msg.sender];
                }
            }
        }
        payable(recipient).transfer(value);
    }
    
}







