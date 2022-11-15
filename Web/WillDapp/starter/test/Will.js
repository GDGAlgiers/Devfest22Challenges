const { expect } = require("chai");

describe("Greeting", function () {

  it("Must return greeing", async () => {
    const Will = await ethers.getContractFactory("Will");
    const will = await Will.deploy();
    expect(await will.greet()).to.equal("Enjoy this challenge!");
  })

});