var AdsBidding = artifacts.require("./AdsBidding.sol");

module.exports = async function(deployer) {
  await deployer.deploy(AdsBidding);
  var adsBiddingInstance = await AdsBidding.deployed()
  await adsBiddingInstance.setInitialBid(0,1000000000000000)
  await adsBiddingInstance.setInitialBid(1,1000000000000000)
};
