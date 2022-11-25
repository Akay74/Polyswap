const main = async () => {
    const [owner] = await hre.ethers.getSigners();

    const aiswapContractFactory = await hre.ethers.getContractFactory('AiSwapToken');
    const aiswapContract = await aiswapContractFactory.deploy();
    await aiswapContract.deployed();
    console.log("Contract deployed to:", aiswapContract.address);
    console.log("Contract deployed by:", owner.address);

    const biswapContractFactory = await hre.ethers.getContractFactory('BiSwapToken');
    const biswapContract = await biswapContractFactory.deploy();
    await biswapContract.deployed();
    console.log("Contract deployed to:", biswapContract.address);
    console.log("Contract deployed by:", owner.address);

};
  
const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();