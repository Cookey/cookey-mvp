pragma solidity ^0.5.1;
    
// 
// Fortune Cookey says: Good things happen to those who wait
//
//              __
//             / _)         
//      .-^^^-/ /          
//   __/       /              
//  <__.|_|-|_|              
//

contract Cookey {

//declare variables to use in the Cookey smart contract
  address owner;
  uint VaultID;
  uint numVaults;
  uint fileID;

//constructor - this function runs on initialization (creation) of the smart contract
    constructor() public {
        owner = msg.sender;
        numVaults = 1;
        fileID = 1;
    }