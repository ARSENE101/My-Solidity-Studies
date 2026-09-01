// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;



contract FundMe{

    uint256 minimumUsd = 5;
    //Target allow users to be able to send money
    // set a minimum amount to fund

    function fund()  public payable {// the payable key word allows the contyract to look red in our contract ==> it is a payable function 
    require(msg.value > 1e18, "Can't send due to insuffecient ETH"); //1e18 = 1e18wei ==> 100000000000000000 <=> 10^18wei ==> 1ETH

    }

    //function withdraw() public {}
    function getPrice() public { // we do not know the price of usd in the blockxchain so we use an arbitrary tool like chainlink to know the decentralixed usd price in real time
    //Adress
    //ABI

    



    }

    function getConvertionRate() public {


    }

}
