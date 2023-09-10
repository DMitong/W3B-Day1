// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenA is ERC20 {
    constructor() ERC20 ("MITCOIN", "MCN"){
        _mint(msg.sender, 1000000 * 10**18);
    }
}