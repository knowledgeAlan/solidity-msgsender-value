// SPDX-License-Identifier:  GPL-3.0
pragma solidity >= 0.8.11;

contract MsgSender {

    mapping (address => uint256) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }


    function see() public view returns (address) {
        return msg.sender;
    }

    function getBalance() public view returns (uint256) {
        return msg.sender.balance;
    }
    

    function getThisBalance() public view returns (uint256){
        return address(this).balance;
    }

    function getThisAddress() public  view returns (address){
        return address(this);
    }


    function withdrawViaTransfer(uint256 amount) public{
        require(address(this).balance >= amount," Invalid withdraw request");
        payable(msg.sender).transfer(amount);
        balances[msg.sender] += amount;
    }

    function withdrawViaSend(uint256 amount) public {

        require(address(this).balance >= amount,"Invalid withdraw request");
        bool sent = payable(msg.sender).send(amount);
        require(sent,"Failed to send ether");
        balances[msg.sender] += amount;
        
    }


    function withdrawViaCall(uint256 amount) public {
        require(address(this).balance >= amount,"Invalid withdraw request");
        (bool sent,bytes memory _data) = msg.sender.call{value:amount}("");
        require(sent,"Failed to send ether");
        balances[msg.sender] += amount;
    }
}