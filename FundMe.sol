// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FundMe{
    //Target allow users to be able to send money
    // set a minimum amount to fund
    uint256 public myValue  = 1;

    function fund()  public payable {// the payable key word allows the contyract to look red in our contract ==> it is a payable function 
    myValue = myValue + 2;
    require(msg.value > 1e18, "Can't send due to insuffecient ETH"); //1e18 = 1e18wei ==> 100000000000000000 <=> 10^18wei ==> 1ETH

    }

    //function withdraw() public {}

}
