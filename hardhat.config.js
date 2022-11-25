require("@nomicfoundation/hardhat-toolbox");
require('@openzeppelin/hardhat-upgrades');

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
}); 

 module.exports = {
  solidity: "0.8.17",
  networks: {
		mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/u5TDMjo8IVchWrha8sQzHSJ8woyhNg_O",
      accounts: [""]
		}
  }
};