// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private value;

    function store(uint256 _v) public {
        value = _v;
    }

    function retrieve() public view returns (uint256) {
        return value;
    }
}
