// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinContract {
    string public name = "MyAltcoin";
    string public symbol = "MAC";
    uint8  public decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10**decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Low balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        return true;
    }
}


Create AltcoinContract.sol, compile.

Deploy with an initial supply argument, e.g. 1000.

After deployment, check balanceOf(deployer) → it will be 1000 * 10**18.

Call transfer to move coins to another address, then check both balances again.
