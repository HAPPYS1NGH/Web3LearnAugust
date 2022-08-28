// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

//Voting DApp that will make voters send 1ETH to vote and only 1 Time
contract Voting_DApp{

    //Owner of the contract that deploys the program
    address payable owner ;
    
    //A mapping which maps the address to the amount of ethers they gave in contract
    mapping(address => uint256) public isVoted ;

    //To check if the Voting Period is open or closed
    enum VotingOpen{ Open, Closed }

    //Status of the Voting Period
    VotingOpen public VoteStatus ; 

    /**
        @dev Initialise the Owner to the address who deployed the Contract as soon as the contract is deployed
    */
    constructor()
    {
        owner =payable(msg.sender);
    } 

    /**
        @dev Shows the Status of the Voting i.e. Open or Closed
    */
    function VotingStatus() public view returns(VotingOpen){
        return VoteStatus;
    }

    /**
        @dev Close the Voting Period
    */

    function VotingClosed() public{
        require(msg.sender == owner,"You are Not Owner");
        VoteStatus = VotingOpen.Closed;
    }

    /**
        @dev Open the Voting Period
    */

    function VotingOpened() public{
        require(msg.sender == owner,"You are not Owner");
        VoteStatus = VotingOpen.Open;
    }

    /**
        @dev To Vote by Sending 1 ETH to the Contract and only Once and only if Voting is open
    */

    function Voting() payable public
    {
        require(msg.value == 1000000000000000000 ,"Send 1 Ether ");
        require(isVoted[msg.sender]!= 1,"You have already Voted"); 
        require(VoteStatus == VotingOpen.Open,"You are Late Voting is Closed");
        isVoted[msg.sender] = 1;
    }

    /**
        @dev Shows the Funds present in the Balance
    */

    function ContractBalance()public view returns (uint256)
    {
        return address(this).balance;
    }

    /**
        @dev To withdraw the Funds to the owner account
    */

    function withdrawFunds() public payable
    {
        require(msg.sender == owner,"Only Owner can withdraw Money");
        owner.transfer(ContractBalance());
    }

}
