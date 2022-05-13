// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract UniverseNFT is ERC721Enumerable, Ownable {

    string private _baseTokenURI;

    constructor() ERC721("Universe NFT", "UNIVERSE") {
        setBaseURI("https://gateway.pinata.cloud/ipfs/QmZT6btcsZwpvxpjy9jiK3JEdhpkYpfcdfYKwKsuojwQ7e/");
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(_baseTokenURI, Strings.toString(_tokenId)));
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        _baseTokenURI = baseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function mint() public {
        uint256 totalSupply = totalSupply();
        if(totalSupply == 10) return;
        _safeMint(msg.sender, totalSupply + 1);
    }

    function mint(uint256 numTokens) public {
        uint i = 0;
        for(i = 0; i<numTokens; i++) {
            uint256 totalSupply = totalSupply();
            if(totalSupply == 10) return;
            _safeMint(msg.sender, totalSupply + 1);
        }
    }

}