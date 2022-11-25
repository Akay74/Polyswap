const main = async () => {
    const [owner] = await hre.ethers.getSigners();
    const polyswapContractFactory = await hre.ethers.getContractFactory('PolySwap');
    const polyswapContract = await polyswapContractFactory.deploy(
        "0xBE30CE01447e911358968C062b0b23E38C4A25b4", 
        "0x6a9826deA31f055a1BD4D58d545a8c07753FaCdF",
        "Polyswap",
        "POLY"
        );
    await polyswapContract.deployed();
    console.log("Contract deployed to:", polyswapContract.address);
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