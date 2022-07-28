// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public num;

    function increment() public {
        num++;
    }

    function decrement() public {
        num--;
    }

    function getNum() public view returns (uint256) {
        return num;
    }
}
