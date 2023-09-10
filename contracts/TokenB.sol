// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenB is ERC20 {
    constructor() ERC20 ("DAPCOIN", "DCN"){
        _mint(msg.sender, 1000000 * 10**18);
    }
}