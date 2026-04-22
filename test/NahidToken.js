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



});