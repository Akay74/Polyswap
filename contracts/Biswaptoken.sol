// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BiSwapToken is ERC20, Ownable {
    constructor() ERC20("BiSwap", "BSP") {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }
}