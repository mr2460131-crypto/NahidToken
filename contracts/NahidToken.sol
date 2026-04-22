// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;

  contract NahidToken{
    string public name ="NahidToken";
    string public symbol= "NAID";
    uint256 public totalSupply =5000000;
    mapping(address =>uint256) public balanceOf;
    mapping (address => mapping(address=>uint256)) public allowance;
   event Transfer(address indexed from, address indexed to, uint256 amount, uint256 remainingBalance);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
    

     constructor(){
         balanceOf[msg.sender]=totalSupply;
     }

     function transfer(address to, uint256 amount) public{
         require(balanceOf[msg.sender]>=amount,"You are a gorib");
         require(amount >0,'sorry');
         require(balanceOf[msg.sender]- amount >=10,"You have to keep minimum balance");
              balanceOf[msg.sender]-=amount;
              balanceOf[to]+=amount;  
     emit Transfer(msg.sender,to,amount,balanceOf[msg.sender]);
      
     }
     function approve(address spender ,uint256 amount) public{
             allowance[msg.sender][spender] = amount;
             emit Approval(msg.sender, spender, amount);

      }
      function transferFrom(address from,address to,uint256 amount) public {
               require(allowance[from][msg.sender]>= amount,"you are not allowed");
               require(balanceOf[from]>=amount,"you are out of balance");
               allowance[from][msg.sender] -= amount;
               balanceOf[from] -= amount;
               balanceOf[to] +=amount;
               emit Transfer (from, to, amount,balanceOf[from]);
      }
     
  }