//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract Pay2Owner{

    address payable owner1;
    address payable owner2;

    mapping(address => uint) public mp;
    
    uint256 public totalBal;

    //Initialise Owner             
    constructor() {
        owner1=payable(msg.sender);
    }

    // Initialise 2nd Owner        
    function setOwner2(address _owner2) public {
        require(msg.sender==owner1 , "Only Owner Could second Owner");
            owner2= payable(_owner2);
    }

    // Ethers in the Smart Contract
    function ContractBalance() public view returns (uint256){
        return address(this).balance;
    }

    //Adding Ethers to the Contract
    function addMoney() public payable {
        require(msg.value>0, "Cant Add Money without ethers");
    }

        //Send _money ethers from smart contract to _to   
        function sendMoney( address  payable _to, uint _money) public payable{
            _to.transfer(_money);
    }

    //Withdraw the _money from contract and providing logic
   function withdraw(uint256 _money) public payable {
        
        require(msg.sender==owner1 || msg.sender == owner2, "Only Owner can withdraw funds");
            if((mp[msg.sender]+_money < totalBal/2))
                  {
                      sendMoney(payable(msg.sender),_money);
                  mp[msg.sender] += _money;
        }
        else
        {
            require(mp[msg.sender] != totalBal/2,"ALREADY WITHDRAWN");
            sendMoney(payable(msg.sender), ((totalBal/2 - mp[msg.sender] )));
            mp[msg.sender] +=totalBal/2 - mp[msg.sender];
        }
        }
    }

    }

