// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MaliciousContract {
    address public immutable owner;
    address public target;
    constructor(address _target) {
        owner = msg.sender;
        target = _target;
    }

    function attack() public {
        // EXPLOIT
    }
    //EXPLOIT FUNCTIONS
}
