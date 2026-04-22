const {expect} =require("chai");
const {ethers} = require("hardhat");

describe("NahidToken",function(){
  let token;
  let owner;
    beforeEach(async function(){
         const Token = await ethers.getContractFactory("NahidToken");
         [owner] = await ethers.getSigners();
         token = await Token.deploy();
         await token.waitForDeployment();
    });
    it("should have corect name",async function(){
        expect(await token.name()).to.equal("NahidToken");
    });
    it("should have totalSupply",async function(){
        expect(await token.totalSupply()).to.equal(5000000);
    });
    it("should give all the token to owner",async function(){
         expect(await token.balanceOf(owner.address)).to.equal(5000000);
    });
    it("should transfer token correctly",async function(){
        const [owner,addr1] = await ethers.getSigners();
        await token.transfer(addr1.address,100);
        expect(await token.balanceOf(addr1.address)).to.equal(100);
    });

   it("should fail if insufficient balance",async function(){
     const  [owner,addr1] = await ethers.getSigners();
      await expect(token.transfer(addr1.address,6000000)).to.be.revertedWith("You are a gorib");
   });
   it ("should fail,if below minimum balance",async function(){
       const [owner,addr1] = await ethers.getSigners();
       await expect(token.transfer(addr1.address,4999991)).to.be.revertedWith("You have to keep minimum balance");
   }) ; 

});