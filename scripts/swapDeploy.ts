import { ethers, network } from "hardhat";

async function main() {
  let TokenA = "0x845a56aEa7aBE39DB2BFAf0fe80278155D1fe8d3";
  let TokenB = "0x6FFdD8060Bc198780cbA9C14712f25ACE10B08Dc";

//   const swapContract = await ethers.deployContract("SwapContract", [TokenA, TokenB]);
//   await swapContract.waitForDeployment();

//   console.log(`Swap Contract deployed to: ${swapContract.target}`);

// Deploying the contract for testing
const swapContractAddr = "0x7425C3E6d636A28840De7bEcec2a136e2DEd88Ca";
const swapContract = await ethers.getContractAt("IswapContract", swapContractAddr);
const tokenAContract = await ethers.getContractAt("ITokenA", TokenA);
const tokenBContract = await ethers.getContractAt("ITokenB", TokenB);

  // const [account] = await ethers.getSigners();
  const account = "0x3C5E0d51B3E5a09981bD070Fc7d1D4ABfD0f076C"
  const signer = await ethers.getImpersonatedSigner(account);
  const maxAmount = 10000;

  // Approving this contract to spend the tokens
  await tokenAContract.connect(signer).approve(swapContractAddr, maxAmount);
  await tokenBContract.connect(signer).approve(swapContractAddr, maxAmount);

  // Swap token A for token B
  const amountA = ethers.parseEther("1");
  await swapContract.swapAForB(amountA);

  // Swap token B for token A
  const amountB = ethers.parseEther("2");
  await swapContract.swapBForA(amountB);

  // Add liquidity
  const amountToAddA = ethers.parseEther("100"); 
  const amountToAddB = ethers.parseEther("200"); 
  await swapContract.addLiquidity(amountToAddA, amountToAddB);

  // Remove liquidity
  const amountToRemoveA = ethers.parseEther("50"); 
  const amountToRemoveB = ethers.parseEther("100");
  await swapContract.removeLiquidity(amountToRemoveA, amountToRemoveB);

  // Get reserves
  const [reserveA, reserveB] = await swapContract.getReserves();
  console.log(`Reserve A: ${reserveA.toString()}`);
  console.log(`Reserve B: ${reserveB.toString()}`);

  // Get liquidity for an address
//   const [liquidityA, liquidityB] = await swapContract.getLiquidity(account.address);
  const [liquidityA, liquidityB] = await swapContract.getLiquidity(signer);
//   console.log(`Liquidity for ${account.address}`);
  console.log(`Liquidity for ${signer}`);
  console.log(`Token A Liquidity: ${liquidityA.toString()}`);
  console.log(`Token B Liquidity: ${liquidityB.toString()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});