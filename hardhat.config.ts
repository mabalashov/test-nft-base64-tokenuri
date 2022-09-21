import * as dotenv from 'dotenv';

import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import '@nomiclabs/hardhat-ethers';

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.17",

  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },

  networks: {
    goerli: {
      url: process.env.ETH_GOERLI_TESTNET_URL,
      accounts: [process.env.PRIVATE_KEY || ''],
    },
  },
};

export default config;
