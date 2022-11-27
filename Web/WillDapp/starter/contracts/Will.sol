// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Will {
    string public greetings = "Enjoy this challenge!";

    function greet() public view returns(string memory) {
        return greetings;
    }
}