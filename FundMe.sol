// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

//the code taken from https://github.com/smartcontractkit/chainlink-evm/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol?utm_source=chatgpt.com
// their(chainlink) updated aggregatorinterface code we need for the ABI (Bunch of functions our contract will use to interact fluently with other contracts)

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";// just like we did in storagefactory and importing simplestorage by ourselves
import {PriceConverter} from "./PriceConverter.sol";

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
    using PriceConverter for uint256;
    uint256 minimumUsd = 5 * 1e18;
    //Target allow users to be able to send money
    // set a minimum amount to fund

    address[] public funders;  // to store our funders details in an array
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded ;

    address public owner;

    constructor () {
      minimumUsd = 2;


    }


    function fund()  public payable {// the payable key word allows the contyract to look red in our contract ==> it is a payable function 
    require(msg.value.getConvertionRate() > 1e18, "Can't send due to insuffecient ETH"); //1e18 = 1e18wei ==> 100000000000000000 <=> 10^18wei ==> 1ETH
    //require(getConvertionRate(msg.value) > 1e18, "Can't send due to insuffecient ETH"); //===> this line checks for the minimum amount to be sent to be exactly above 5$
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value; // addressToAmountFunded[msg.sender] + msg.value <==> addressToAmountFunded[msg.sender] + msg.value

    }



    function withdraw() public onlyOwner {

        for (uint256 funderIndex = 0 ; funderIndex < funders.length; funderIndex++){

          address funder = funders[funderIndex];
          addressToAmountFunded[funder] = 0;

        }

        //reset the array 
        funders = new address[](0);
        //withdraw has 3 different ways ==> transfer, send, call.
        //transfer; the problem with transfer is if it fails it will error and revert the transaction with 2300 gas consumed.
        // payable (msg.sender).transfer(address(this).balance); // msg.sender is of type address but we need it to be of type payable

        // //send; this consumes 2300 gas fee as well but when it fails it returns a boolean.

        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess, "send failed ");

        //call in our situation call will be our recomended way
        (bool callSuccess, bytes memory dataReturned) = payable (msg.sender).call{value: address (this).balance}("");
          require(callSuccess, "call failed");
    }


    //Modifier are keywords we could add to a fun ction to increase efficiency and functionality.
     modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this function");
        _; //this is a placeholder for the rest of the function
    }



}
