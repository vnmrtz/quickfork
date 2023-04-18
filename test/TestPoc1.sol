// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// IMPORT INTERFACES
//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
//import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
//import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

// IMPORT CONTRACTS
import "../src/mocks/MockERC20.sol";
import "../src/mocks/MockERC721.sol";
import "../src/mocks/MockERC1155.sol";

import "../src/MaliciousContract1.sol";

contract TestPoC is Test {
    // fork identifier
    uint256 fork;
    
    // RPC URL
    string RPC_URL = vm.envString("RPC_URL");
    address target = vm.envAddress("TARGET_ADDRESS");

    // ON-CHAIN CONTRACTS
    IERC20 tokenA = IERC20(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174); //USDC address
    
    // USERS 
    address alice = address(1);
    address bob = address(2);// bob always gets rekt :/

    function setUp() public {
        fork = vm.createFork(RPC_URL);
        vm.selectFork(fork);

        // SETUP
        deal(address(tokenA), alice, 10 ether);
        deal(address(tokenA), bob, 10 ether);
        startHoax(alice, 10 ether);
    }

    // UNIT TEST
    function test_exploitUnit() public {
        vm.stopPrank();
        vm.prank(bob);

        // EXPLOIT
        tokenA.transfer(alice, 1 ether);

        assertEq(tokenA.balanceOf(alice), 11 ether);
    }

    // FUZZ TEST
    function testExploitFuzz(uint256 amount) public {
        vm.assume(amount <= 10 ether);

        // EXPLOIT
        tokenA.transfer(target, amount);

        assertEq(tokenA.balanceOf(alice), 10 ether - amount);
    }
}
