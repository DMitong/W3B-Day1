//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.19;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IswapContract {

  function swapAForB(uint _amountA) external;

  function swapBForA(uint _amountB) external;

  function addLiquidity(uint _amountA, uint _amountB) external;

  function removeLiquidity(uint _amountA, uint _amountB) external;

  function getReserves() external view returns (uint, uint);

  function getLiquidity(address addr) external view returns (uint, uint);

}

interface ITokenA {
    function approve(address spender, uint256 value) external returns (bool);
}

interface ITokenB {
    function approve(address spender, uint256 value) external returns (bool);
}