import { ethers } from "hardhat";

async function main() {
    const TokenADeployment = await ethers.deployContract("TokenA", [])
    await TokenADeployment.waitForDeployment()

    const TokenBDeployment = await ethers.deployContract("TokenB", [])
    await TokenBDeployment.waitForDeployment()

    console.log(
        `Token A deployed to ${TokenADeployment.target}`,
        `Token B deployed to ${TokenBDeployment.target}`
    )
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

  //Token A address: 0x845a56aEa7aBE39DB2BFAf0fe80278155D1fe8d3
  //Token B address: 0x6FFdD8060Bc198780cbA9C14712f25ACE10B08Dc