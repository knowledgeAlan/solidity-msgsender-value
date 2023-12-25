# solidity-msgsender-value
## Goal: Distinguish msg.sender msg.value address(this) address(this).balance 

msg.sender = deployer account

msg.value = deployer account balance

address(this) = Smart contract deploy address

address(this).balance = Smart contract balance




 <img width="1167" alt="image" src="https://github.com/knowledgeAlan/solidity-msgsender-value/assets/5988231/81194c19-c228-4520-a0e0-6325d5be16ea">


msg.sender = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
msg.value = 100

First of all, you don’t need to specify address(this).balance to receive funds directly to the contract. As long as a function is payable and you do not specify what to do with msg.value, all funds wil directly go into the contract internal balance.

## Below image before deposit 

<img width="1137" alt="image" src="https://github.com/knowledgeAlan/solidity-msgsender-value/assets/5988231/f8b863df-3386-4257-8c91-16f1011a8849">



<img width="971" alt="image" src="https://github.com/knowledgeAlan/solidity-msgsender-value/assets/5988231/87faa35b-484f-4c40-9159-d920e2233084">


## Below image after deposit 10 wei



<img width="1267" alt="image" src="https://github.com/knowledgeAlan/solidity-msgsender-value/assets/5988231/9d30e42f-cd14-4b8c-8c12-eaea90adb6c0">


   function deposit() public payable {
        balances[msg.sender] += msg.value;
    }



### Now we withdraw our money from the contract.


### You write 10 to the withdrawViaTransfer.


<img width="1136" alt="image" src="https://github.com/knowledgeAlan/solidity-msgsender-value/assets/5988231/068a3925-8389-4e6a-a4ea-432428c99a42">

Below image after withdraw.

<img width="1193" alt="image" src="https://github.com/knowledgeAlan/solidity-msgsender-value/assets/5988231/5762e94e-b773-43f7-a6ee-949fbe286c7a">


