// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";// just like we did in storagefactory and importing simplestorage by ourselves


library PriceConverter{

    //function withdraw() public {}
    function getPrice() internal view returns(uint256) { // we do not know the price of usd in the blockxchain so we use an arbitrary tool like chainlink to know the decentralixed usd price in real time
    //Adress 0x694AA1769357215DE4FAC081bf1f309aDC325306 
    //ABI = agreagtorinterface

    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (uint80 roundId, int256 price, uint256 startedAt, uint256 timeStamp, uint80 answerdInRound ) = priceFeed.latestRoundData();

    return uint256(price * 1e10);
    }

    function getConvertionRate(uint256 ethAmount) internal view returns (uint256) {

       uint256 ethPrice = getPrice();
       uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; //In solidity it is important to multiply before you divide.
       return ethAmountInUsd;

    }

    function getVersion() internal view returns (uint256) {

      return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version(); // this line uses the agregatorinterface code to interact with that chain address.

    }


}
