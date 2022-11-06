const { expect } = require("chai");

describe("Greeting", function () {
  
  it("Must return greeing", async () => {
    const Greeter = await ethers.getContractFactory("Greet");
    const greet = await Greeter.deploy();
    expect(await greet.greet()).to.equal("Enjoy this challenge!");
  })

});
