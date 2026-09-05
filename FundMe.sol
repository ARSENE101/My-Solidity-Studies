// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

//the code taken from https://github.com/smartcontractkit/chainlink-evm/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol?utm_source=chatgpt.com
// their(chainlink) updated aggregatorinterface code we need for the ABI (Bunch of functions our contract will use to interact fluently with other contracts)

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";// just like we did in storagefactory and importing simplestorage by ourselves

// solhint-disable-next-line interface-starts-with-i
// interface AggregatorV3Interface {
//   function decimals() external view returns (uint8);

//   function description() external view returns (string memory);

//   function version() external view returns (uint256);

//   function getRoundData(
//     uint80 _roundId
//   ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

//   function latestRoundData()
//     external
//     view
//     returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
// }


// the agregator code 

contract FundMe{

    uint256 minimumUsd = 5;
    //Target allow users to be able to send money
    // set a minimum amount to fund

    function fund()  public payable {// the payable key word allows the contyract to look red in our contract ==> it is a payable function 
    require(msg.value > 1e18, "Can't send due to insuffecient ETH"); //1e18 = 1e18wei ==> 100000000000000000 <=> 10^18wei ==> 1ETH

    }

    //function withdraw() public {}
    function getPrice() public view returns(uint256) { // we do not know the price of usd in the blockxchain so we use an arbitrary tool like chainlink to know the decentralixed usd price in real time
    //Adress 0x694AA1769357215DE4FAC081bf1f309aDC325306 
    //ABI = agreagtorinterface

    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (uint80 roundId, int256 price, uint256 startedAt, uint256 timeStamp, uint80 answerdInRound ) = priceFeed.latestRoundData();

    return uint256(price * 1e10);
    }

    function getConvertionRate() public {


    }

    function getVersion() public view returns (uint256) {

      return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version(); // this line uses the agregatorinterface code to interact with that chain address.

    }

}
