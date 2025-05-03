// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AdvancedTransactionManager {
    address public owner;
    mapping(address => uint256) public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        balance[address(this)] += msg.value;
    }

    function transferETH(address payable to, uint256 amt) public {
        require(balance[address(this)] >= amt, "Low balance");
        balance[address(this)] -= amt;
        to.transfer(amt);
    }

    function withdraw(uint256 amt) public {
        require(msg.sender == owner, "Not owner");
        require(balance[address(this)] >= amt, "Low balance");
        balance[address(this)] -= amt;
        payable(owner).transfer(amt);
    }

    function contractBalance() public view returns (uint256) {
        return balance[address(this)];
    }
}
