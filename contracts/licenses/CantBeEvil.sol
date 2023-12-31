// SPDX-License-Identifier: MIT
// MetaIP Contracts v0.0.1 (CantBeEvil.sol)
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./ICantBeEvil.sol";

enum LicenseVersion {
    PUBLIC,
    EXCLUSIVE,
    COMMERCIAL,
    COMMERCIAL_NO_HATE,
    PERSONAL,
    PERSONAL_NO_HATE,
    METAIP_COMMUNITY
}

contract CantBeEvil is ERC165, ICantBeEvil {
    using Strings for uint;
   // a16z CBE Arweave PDF DOCs
   // string internal constant _BASE_LICENSE_URI = "ar://zmc1WTspIhFyVY82bwfAIcIExLFH5lUcHHUN0wXg4W8/";
  
    // MetaIP Multi Lang + Community Arweave PDF DOCs
    string internal constant _BASE_LICENSE_URI = "ar://2om8up8MggA9XZJMgvTeENMJhhV6x5preREexjP-xL4/";
    LicenseVersion internal licenseVersion;
    constructor(LicenseVersion _licenseVersion) {
        licenseVersion = _licenseVersion;
    }

    function getLicenseURI() public view returns (string memory) {
        return string.concat(_BASE_LICENSE_URI, uint(licenseVersion).toString());
    }

    function getLicenseName() public view returns (string memory) {
        return _getLicenseVersionKeyByValue(licenseVersion);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165) returns (bool) {
        return
            interfaceId == type(ICantBeEvil).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function _getLicenseVersionKeyByValue(LicenseVersion _licenseVersion) internal pure returns (string memory) {
        require(uint8(_licenseVersion) <= 7);
        if (LicenseVersion.PUBLIC == _licenseVersion) return "PUBLIC";
        if (LicenseVersion.EXCLUSIVE == _licenseVersion) return "EXCLUSIVE";
        if (LicenseVersion.COMMERCIAL == _licenseVersion) return "COMMERCIAL";
        if (LicenseVersion.COMMERCIAL_NO_HATE == _licenseVersion) return "COMMERCIAL_NO_HATE";
        if (LicenseVersion.PERSONAL == _licenseVersion) return "PERSONAL";
        if (LicenseVersion.PERSONAL_NO_HATE == _licenseVersion) return "PERSONAL_NO_HATE";
        else return "METAIP_COMMUNITY";
    }
}
