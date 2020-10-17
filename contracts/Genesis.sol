// SPDX-License-Identifier: Unlicense
pragma solidity ^0.6.2;

import "./Expansion.sol";

contract Genesis {
    mapping(address => address) expansions;
    address[] existingExpansions;

    constructor () public {}

    function createExpansion(string memory _expansion, string memory _symbol) public returns (address) {
        Expansion expansion = new Expansion(_expansion, _symbol);
        address expansionAddr = address(expansion);

        expansions[expansionAddr] = expansionAddr;
        existingExpansions.push(expansionAddr);

        return expansionAddr;
    }

    function getExpansions() public view returns (address[] memory _expansions) {
        return existingExpansions;
    }

    function newLegend(address _expansion, string memory uri) public returns(uint256 newItemId) {
        require(expansions[_expansion] != address(0), "Expansion does not exists");
        Expansion expansion = Expansion(expansions[_expansion]);
        newItemId = expansion.newLegend(msg.sender, uri);
        return newItemId;
    }

    function ownerOf(address _expansion, uint256 _tokenId) public view returns (address owner) {
        require(expansions[_expansion] != address(0), "Expansion does not exists");
        Expansion expansion = Expansion(expansions[_expansion]);
        owner = expansion.ownerOf(_tokenId);
        return owner;
    }


    function tokenURI(address _expansion, uint256 _tokenId) public view returns (string memory uri) {
        require(expansions[_expansion] != address(0), "Expansion does not exists");
        Expansion expansion = Expansion(expansions[_expansion]);
        uri = expansion.tokenURI(_tokenId);
        return uri;
    }
}
