// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;

  contract NahidToken{
    string public name ="NahidToken";
    string public symbol= "NAID";
    uint256 public totalSupply =5000000;
    mapping(address =>uint256) public balanceOf;

     constructor(){
         balanceOf[msg.sender]=totalSupply;
     }

     function transfer(address to, uint256 amout) public{
              balanceOf[msg.sender]-=amout ;
              balanceOf[to]+=amout;  
     }
  }
  