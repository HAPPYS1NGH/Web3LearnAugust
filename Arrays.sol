//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Array{

    uint[] public arr = [1,2,3,4,5];

    //Deleting the element at the index and replacing the last element with deleted element 
    function deleteELement(uint _index) public
    {
        delete arr[_index-1];
        arr[_index-1]=arr[arr.length-1];
        arr.pop();
    }
    function addElement(uint _val) public {
        arr.push(_val);
    }

    //Retrieve the array with the size rather than returning the whole array #SaveGasBecomeRich
    function provideSize() public view returns(uint){
        return arr.length;
    }
}
