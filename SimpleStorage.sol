// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SimpleStorage{

        uint256 public favoriteNumber;


// Noting there are 2 states of functions, a function 
//that is actively changing the state of the blockchain, 
//that is updating and doing a transaction, etc for example
// our store function here affects the state of the blockchain
// by storing a value so it will show on the deploy tab as orange
// a not so participant function that does not change the state of the 
// blockvhain for example our retrieve function will be blue on the deploy tab


    function store(uint256 _favoriteNumber) public {
            favoriteNumber =  _favoriteNumber;
    }
// again a function can be in a view or pure state, view means it
// can read but cannot change state of the blockchain in whatsoever way
// pure on the other hand cannot read from functions talk less of changing
// the state of the function. they are always blue on the deploy tab
// because one does not have to 
// another interesting fact is these functions(the ones that dont change the state of the blockchain)
// actually dont cost gas except they are being calle by another function that actually does affect the state of the blockchain
// for example our store function here calling our retrieve function (return retrieve; or just retrieve;) 
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

}
