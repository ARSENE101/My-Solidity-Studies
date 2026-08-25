// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

//importing our previous contract(SimpleStorage.sol)
import {SimpleStorage} from "./SimpleStorage.sol"; // import formating precises what particular contract we want imoorted here 
//import {SimpleStorage, SinpleStorage2} from "./SimpleStorage.sol"; this specfies the different contract as well but shows a use case of a more than one contract intended to be used.


contract StoragreFactory{
    //stores the contracts we create or transact in an array
     SimpleStorage[] public listOfSimpleStorageContracts;
   
    function createSimpleStorageContract() public {
        
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);// push the contracts adress or reference into the list
    
    }

    function sfStore (uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public  {
        // Get the SimpleStorage contract reference stored at this array index and assign it to mySimpleStorage
        // let SimpleStorage mySimpleStorage = x, ==> x = listOfSimpleStorageContracts[_simpleStorageIndex]
        // now what is listOfSimpleStorageContracts[_simpleStorageIndex]? the array of listOfSimpleStorageContracts created above
        // so any contract created by the CreateSimpleStorage function, retains an adress and that adress has an index in our function below = _simpleStorageIndex. 
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber); // stores this number in the contract with the index value 
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }

    }



