
const contract = require('AliToken');
const TokenArtifact = require('./../build/contracts/AliToken.json');


describe("Ali Token contract", function () {
    let accounts;
    

    before(async function () {
      accounts = await web3.eth.getAccounts();
      let web3 = new Web3(Web3.givenProvider);
      let contract = new web3.eth.Contract(ABI, Contract_Address);

    });
  
    describe("Deployment", function () {
      it("Should deploy with the right greeting", async function () {
        const greeter = await Greeter.new("Hello, world!");
        assert.equal(await greeter.greet(), "Hello, world!");
  
        const greeter2 = await Greeter.new("Hola, mundo!");
        assert.equal(await greeter2.greet(), "Hola, mundo!");
      });
    });
  });