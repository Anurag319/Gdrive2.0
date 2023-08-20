require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
      chainId: 31337,
    },
  },
  // this will make sure when we will compile then where ABI and bytecode will generate
  paths: {
    artifacts: "./client/src/artifacts",
  },
};