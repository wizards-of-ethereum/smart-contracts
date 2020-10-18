// SPDX-License-Identifier: Unlicense
pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Wizard.sol";

contract WOET is ERC20, Ownable {
    constructor () ERC20("Wizards Of Ethereum Token", "WOET") public {}

    function mintMinerReward(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

       function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }
}