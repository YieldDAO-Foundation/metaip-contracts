// SPDX-License-Identifier: MIT
// METAIP Contracts v0.0.1 (ICantBeEvil.sol)
pragma solidity ^0.8.13;

interface ICantBeEvil {
    function getLicenseURI() external view returns (string memory);
    function getLicenseName() external view returns (string memory);
}