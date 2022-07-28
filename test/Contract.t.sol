// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Contract.sol";

contract ContractTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function testNumZero() public {
        assertEq(counter.num(), 0);
    }

    function testIncrementByOne() public {
        emit log_named_uint("num", counter.num());
        counter.increment();
        assertEq(counter.getNum(), 1);
    }

    function testDecrementByOne() public {
        counter.increment();
        counter.increment();
        emit log_named_uint("num", 2);
        counter.decrement();
        assertEq(counter.getNum(), 1);
    }

    function testFailDecrementByOne() public {
        counter.decrement();
        assertEq(counter.getNum(), 0);
    }

    function testCannotDecrementByOne() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();
        assertEq(counter.getNum(), 0);
    }
}
