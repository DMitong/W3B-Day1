# Swap Smart Contract for MITCOIN and DAPCOIN - ERC20 Tokens

This project has three artefacts namely:
1. An ERC-20 Token called MITCOIN deployed and verified at the Sepolia Testnet at 0x845a56aEa7aBE39DB2BFAf0fe80278155D1fe8d3.
2. An ERC-20 Token called DAPCOIN deployed and verified at the Sepolia Testnet at 0x6FFdD8060Bc198780cbA9C14712f25ACE10B08Dc.
3. A Smart Contract that performs a calculated swap between the two created tokens deployed and verified at the Sepolia Testnet at 0x7425C3E6d636A28840De7bEcec2a136e2DEd88Ca.

This project also demonstrates a Hardhat use case. It comes with the contracts and the scripts that deploys the contracts.

More Information:
1. Overview of MITCOIN (MCN) Contract
This contract implements the MITCOIN (MCN) ERC20 token. It is a standard ERC20 token contract that allows for the creation and transfer of MCN tokens. The contract is written in Solidity and follows the OpenZeppelin library's implementation of ERC20.

Token Details
Token Name: MITCOIN
Token Symbol: MCN
Initial Supply: 1,000,000 MCN
Decimals: 18

2. Overview of MITCOIN (MCN) Contract
This contract implements the MITCOIN (MCN) ERC20 token. It is a standard ERC20 token contract that allows for the creation and transfer of MCN tokens. The contract is written in Solidity and follows the OpenZeppelin library's implementation of ERC20.

Token Details
Token Name: MITCOIN
Token Symbol: MCN
Initial Supply: 1,000,000 MCN
Decimals: 18

3. Overview of the Swap Contract
The SwapContract is a solidity smart contract written in solidity. It is deployed on the Sepolia testnet with typescript deployment script using Hardhat.

Contract Description
The SwapContract is designed to facilitate the swapping of tokens on the Sepolia testnet. It allows users to swap tokenA(MITCOIN) for tokenB(DAPCOIN) and vice versa, as well as provide liquidity and remove liquidity from the contract.

Features
The SwapContract offers the following features:
- Token Swapping: The swapping rate is calculated based on the reserves of tokenA and tokenB.
- Liquidity Provision
- Liquidity Removal
- Reserves and Liquidity Information

Deployment
The SwapContract is deployed on the Sepolia testnet using Hardhat. To deploy the contract, follow these steps:

Please note that the code provided is just an example, and you may need to modify it to suit your specific requirements.

Contributing
If you encounter any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on the GitHub repository. I appreciate any contributions to make this contract better.

License
The SwapContract is released under the UNLICENSED license. You are free to use, modify, and distribute the contract as per your requirements.