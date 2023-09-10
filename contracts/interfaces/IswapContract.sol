//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.19;

interface ITokenSwap {

  function swapAForB(uint _amountA) external;

  function swapBForA(uint _amountB) external;

  function addLiquidity(uint _amountA, uint _amountB) external;

  function removeLiquidity(uint _amount) external;

  function getReserves() external view returns (uint, uint);

}