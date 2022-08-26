//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ComparingStrings{

    function compareTwoStrings(string memory _s1,string memory _s2) pure public returns(bool){
        if(keccak256(abi.encodePacked(_s1)) == keccak256(abi.encodePacked(_s2))){
            return true;
        }
        else{
            return false;
        }
    }


}
