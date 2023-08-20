// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require('hardhat');

async function main() { 
  // const [deployer] = await hre.ethers.getSigners();
  const Upload = await hre.ethers.getContractFactory("Upload");
  const upload = await Upload.deploy();

  // await upload.deployed();

  console.log("Library deployed to:", upload.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// const hre = require("hardhat");

// async function main() {
//   const lockedAmount = hre.ethers.parseEther("0.001");
//   const upload = await hre.ethers.deployContract("Upload",{value:lockedAmount});

//   await upload.waitForDeployment();
//   console.log("Library deployed to:", upload.address);
// }

// // We recommend this pattern to be able to use async/await everywhere
// // and properly handle errors.
// main().catch((error) => {
//   console.error(error);
//   process.exitCode = 1;
// });
