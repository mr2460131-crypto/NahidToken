// SPDX-License-Identifier: MIT
pragma solidity^0.8.20;
   import "./Ownable.sol"; 
  contract NahidToken is Ownable{
    
    bool public paused = false;
    string public name ="NahidToken";
    string public symbol= "NAID";
    uint256 public totalSupply =5000000;
    mapping(address =>uint256) public balanceOf;
    mapping (address => mapping(address=>uint256)) public allowance;
   event Transfer(address indexed from, address indexed to, uint256 amount, uint256 remainingBalance);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
    
  constructor() {
    balanceOf[msg.sender] = totalSupply;
}
     
     
        modifier whenNotPaused(){
            require (paused == false,"Contract is paused");
            _;
        }

        function pause() public onlyOwner{
            paused = true;
        }
        function unpaused() public onlyOwner{
            paused = false;
        }

      function mint(address to, uint256 amount) public onlyOwner  whenNotPaused{
                     totalSupply += amount;
                     balanceOf[to] += amount;   
       }
       function burn(address from ,uint256 amount) public onlyOwner  whenNotPaused{
                   require(balanceOf[from]>= amount,"You are a gorib");
                   balanceOf[from]-=amount;
                   totalSupply -= amount;
       }
             
     function transfer(address to, uint256 amount) public  whenNotPaused{
         require(balanceOf[msg.sender]>=amount,"You are a gorib");
         require(amount >0,'sorry');
         require(balanceOf[msg.sender]- amount >=10,"You have to keep minimum balance");
              balanceOf[msg.sender]-=amount;
              balanceOf[to]+=amount;  
     emit Transfer(msg.sender,to,amount,balanceOf[msg.sender]);
      
     }
     function approve(address spender ,uint256 amount) public  whenNotPaused{
             allowance[msg.sender][spender] = amount;
             emit Approval(msg.sender, spender, amount);

      }
      function transferFrom(address from,address to,uint256 amount) public  whenNotPaused {
               require(allowance[from][msg.sender]>= amount,"you are not allowed");
               require(balanceOf[from]>=amount,"you are out of balance");
               allowance[from][msg.sender] -= amount;
               balanceOf[from] -= amount;
               balanceOf[to] +=amount;
               emit Transfer (from, to, amount,balanceOf[from]);
      }
     
  }