// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SwapContract {
    IERC20 public tokenA;
    IERC20 public tokenB;

    uint public k;

    uint public reserveA;
    uint public reserveB;

    struct LiquidityProvider {
        uint amountA;
        uint amountB;
    }

    mapping(address => LiquidityProvider) public liquidityProvider;

    event TokenSwap(address indexed sender, uint amountA, uint amountB);

    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }

    function swapAForB(uint _amountA) external {
        require(_amountA > 0, "Amount must be greater than 0");

        uint amountB = (reserveB * (_amountA * reserveA)) / ((reserveA + _amountA) * 1000);

        require(tokenA.transferFrom(msg.sender, address(this), _amountA));
        require(tokenB.transfer(msg.sender, amountB));

        reserveA += _amountA;
        reserveB -= amountB;

        emit TokenSwap(msg.sender, _amountA, amountB);
    }

    function swapBForA(uint _amountB) external {
        require(_amountB > 0, "Amount must be greater than 0");

        uint amountA = (reserveA * (_amountB * reserveB)) / ((reserveB + _amountB) * 1000);

        require(tokenB.transferFrom(msg.sender, address(this), _amountB));
        require(tokenA.transfer(msg.sender, amountA));

        reserveB += _amountB;
        reserveA -= amountA;

        emit TokenSwap(msg.sender, amountA, _amountB);
    }

    function addLiquidity(uint _amountA, uint _amountB) external {
        require(_amountA > 0 && _amountB > 0, "Amount must be greater than 0");

        uint sqrtK = (reserveA * reserveB) / 1000;
        uint mintedLP = (sqrtK * (_amountA + reserveA)) / reserveA - reserveA;

        require(tokenA.transferFrom(msg.sender, address(this), _amountA));
        require(tokenB.transferFrom(msg.sender, address(this), _amountB));

        reserveA += _amountA;
        reserveB += _amountB;

        LiquidityProvider storage provider = liquidityProvider[msg.sender];
        provider.amountA += _amountA;
        provider.amountB += _amountB;

        require(tokenA.transfer(msg.sender, mintedLP));

        emit TokenSwap(msg.sender, _amountA, _amountB);
    }

    function removeLiquidity(uint _amountA, uint _amountB) external {
        require(_amountA > 0 && _amountB > 0, "Amount must be greater than 0");

        LiquidityProvider storage provider = liquidityProvider[msg.sender];

        require(provider.amountA >= _amountA, "Insufficient liquidity for token A");
        require(provider.amountB >= _amountB, "Insufficient liquidity for token B");

        uint sqrtK = (reserveA * reserveB) / 1000;
        uint burnLP = (sqrtK * (_amountA + reserveA)) / reserveA - reserveA;

        require(tokenA.transfer(msg.sender, _amountA));
        require(tokenB.transfer(msg.sender, _amountB));

        provider.amountA -= _amountA;
        provider.amountB -= _amountB;

        reserveA -= _amountA;
        reserveB -= _amountB;

        require(tokenA.transferFrom(address(this), msg.sender, burnLP));

        emit TokenSwap(msg.sender, _amountA, _amountB);
    }

    function getReserves() public view returns (uint, uint) {
        return (reserveA, reserveB);
    }

    function getLiquidity(address addr) public view returns (uint, uint) {
        LiquidityProvider storage provider = liquidityProvider[addr];
        return (provider.amountA, provider.amountB);
    }
}