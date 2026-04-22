// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;

  contract NahidToken{
    string public name ="NahidToken";
    string public symbol= "NAID";
    uint256 public totalSupply =5000000;
    mapping(address =>uint256) public balanceOf;
    event Transfer(address indexed from,address indexed to ,uint256 amout,uint256 remainingBalance

);
    

     constructor(){
         balanceOf[msg.sender]=totalSupply;
     }

     function transfer(address to, uint256 amount) public{
              balanceOf[msg.sender]-=amount;
              balanceOf[to]+=amount;  
     emit Transfer(msg.sender,to,amount,balanceOf[msg.sender]);
     }
     
  }