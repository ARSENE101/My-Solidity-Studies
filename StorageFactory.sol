// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

//importing our previous contract(SimpleStorage.sol)
import {SimpleStorage} from "./SimpleStorage.sol"; // import formating precises what particular contract we want imoorted here 
//import {SimpleStorage, SinpleStorage2} from "./SimpleStorage.sol"; this specfies the different contract as well but shows a use case of a more than one contract intended to be used.


contract StoragreFactory{
    SimpleStorage public simpleStorage;
    function createSimpleStorageContracth() public {
        simpleStorage = new SimpleStorage();
    }

}


