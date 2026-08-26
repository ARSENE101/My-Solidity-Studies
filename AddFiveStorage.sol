// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;


import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{// this is 'inheritsnce' as our AddFiveStorage will now inherit all the properties of our SimpleStorage.sol

function store(uint256 _newNumber) public override { // We are overiding the parent function with our own function.  
        myFavoriteNumber = _newNumber + 5;
}

}
