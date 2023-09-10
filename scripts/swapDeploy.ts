import { ethers } from "ethers";

async function main() {
  const swapContract = await ethers.deployContract("SwapContract", []);
  const tokenASaddress = "0x845a56aEa7aBE39DB2BFAf0fe80278155D1fe8d3"; // Token A address
  const tokenBAddress = "0x6FFdD8060Bc198780cbA9C14712f25ACE10B08Dc"; // Token B address

  const contract = await swapContract.deploy(
    tokenASaddress,
    tokenBAddress
  );

  await contract.deployTransaction.wait();

  console.log(`TokenSwap deployed to ${contract.address}`);
}

main();
