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

        uint amountB = (reserveB * _amountA) / reserveA;

        require(tokenA.transferFrom(msg.sender, address(this), _amountA));

        require(tokenB.transfer(msg.sender, amountB));

        reserveA += _amountA;
        reserveB -= amountB;
    }

    function swapBForA(uint _amountB) external {
  
    require(_amountB > 0, "Amount must be greater than 0");

    uint amountA = (reserveA * _amountB) / reserveB;

    require(tokenB.transferFrom(msg.sender, address(this), _amountB));

    require(tokenA.transfer(msg.sender, amountA));

    reserveB += _amountB;
    reserveA -= amountA;

  }

    function addLiquidity(uint256 _amountA, uint256 _amountB) external {
        IERC20(tokenA).transferFrom(msg.sender, address(this), _amountA);
        IERC20(tokenB).transferFrom(msg.sender, address(this), _amountB);

        reserveA += _amountA;
        reserveB += _amountB;

        LiquidityProvider storage provider = liquidityProvider[msg.sender];
        provider.amountA += _amountA;
        provider.amountB += _amountB;
    }

    function removeLiquidity(uint256 _amountA, uint256 _amountB) external {
        LiquidityProvider storage provider = liquidityProvider[msg.sender];

        require(provider.amountA >= _amountA, "Insufficient liquidity");
        require(provider.amountB >= _amountB, "Insufficient liquidity");

        IERC20(tokenA).transfer(msg.sender, _amountA);
        IERC20(tokenB).transfer(msg.sender, _amountB);

        provider.amountA -= _amountA;
        provider.amountB -= _amountB;

        reserveA -= _amountA;
        reserveB -= _amountB;
    }

    function getReserves() public view returns (uint, uint) {
        return (reserveA, reserveB);
    }

    function getLiquidity(address addr) public view returns (uint, uint) {
        LiquidityProvider storage provider = liquidityProvider[addr];
        return (provider.amountA, provider.amountB);
    }
}
