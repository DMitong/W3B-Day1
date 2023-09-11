import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "dotenv/config";
require("dotenv").config();

const config: HardhatUserConfig = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: process.env.SEPOLIARPC,
      //@ts-ignore
      accounts: [process.env.PRIVATEKEY],
    },
    base: {
      url: process.env.BASETESTNETRPC,
      //@ts-ignore
      accounts: [process.env.PRIVATEKEY],
    },
    // hardhat: {
    //   forking: {
    //     url: process.env.SEPOLIARPC!,
    //     }
    //   }
  },
  etherscan: {
    apiKey: {
      // sepolia: "AKmhFLvNyw0NSzNbUSTaAy2eR75JK_bb",
      base: "WnYSbY37gwkjXxz36dPsPbypx4Damx7s",
    },
  },
};

export default config;
