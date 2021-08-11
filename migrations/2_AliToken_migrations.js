const AliToken = artifacts.require("AliToken");

module.exports = function (deployer) {
  deployer.deploy(AliToken,100000000);
};
