const main = async () => {
    const domainContractFactory = await hre.ethers.getContractFactory("Domains");
    const domainContract = await domainContractFactory.deploy("robo");
    await domainContract.deployed();

    console.log("Contract deployed to:", domainContract.address);

    let txn = await domainContract.register("r2d2", { value: hre.ethers.utils.parseEther('0.1') });
    await txn.wait();
    console.log("Minted domain r2d2.robo");

    txn = await domainContract.setRecord("r2d2", "Domain r2d2.robo");
    await txn.wait()
    console.log("Set record for r2d2.robo");

    const address = await domainContract.getAddress("r2d2");
    console.log("Owner of domain r2d2:", address);

    const balance = await hre.ethers.provider.getBalance(domainContract.address);
    console.log("Contract balance:", hre.ethers.utils.formatEther(balance));
}

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