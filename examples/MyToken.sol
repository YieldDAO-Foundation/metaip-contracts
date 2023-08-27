// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {LicenseVersion, CantBeEvil} from "@metaip/contracts/licenses/CantBeEvil.sol";

contract MyToken is ERC721, Ownable, CantBeEvil {

    constructor() ERC721("MyToken", "MTK") CantBeEvil(LicenseVersion.PUBLIC) {}

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(CantBeEvil, ERC721) returns (bool) {
        return
            super.supportsInterface(interfaceId);
    }

    // this contract inherits getLicenseURI() and getLicenseName() from the CantBeEvil contract
}