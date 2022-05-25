// SPDX-License-Identifier: MIT
pragma solidity > 0.6.3;


contract bank {

    address user;

    modifier onlyOwner {
        user = msg.sender;
        _;
    }

    
    mapping (address => uint) public ownerBalance;

    function setBalance(uint ownerBal) public {
        ownerBalance[msg.sender] = ownerBal;
    }

    constructor()  {
        user = msg.sender;
    }

    function getBalance() public view returns(uint) {
        return user.balance;
    }

    function send(address payable reciever) payable external onlyOwner {
        uint amount = msg.value;
        reciever.transfer(amount);
    }
}