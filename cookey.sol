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
     
//this function is used to prevent others - but owner - to evoke certain functions 
     modifier onlyOwner {
  require(msg.sender == owner);
  _;
     }
     
    //define the structure (attributes) of the file smart asset that will be stored inside the Cookey
    //vault
    struct file
        {
        string IPFShash;
        string FileTopic;
        address sender;
        address beneficiary;
        }
    
       struct Vault {
        address addr;
        uint numFiles;
        mapping (uint => file) files;
    }
    
    mapping(uint=>file) files;
    
  
   // uint vaultID;
    mapping (uint => Vault) Vaults;

   function newVault() public returns (uint vaultID) 
   {
        vaultID = numVaults++; // vaultID is return variable
        // Creates new struct and saves in storage. We leave out the mapping type.
        //Vault[vaultID] = Vault(addr, 0);
        return vaultID;
    }
    
    
    function storefile(string memory _IPFShash, string memory _FileTopic, address _beneficiary) public
        {
        fileID++;
        files[fileID].IPFShash=_IPFShash;
        files[fileID].FileTopic=_FileTopic;
        files[fileID].sender=msg.sender;
        files[fileID].beneficiary=_beneficiary;
        
        }
        
    function getfile(uint _fileID) public view returns(string memory IPFShash, string memory FileTopic,address  sender,  address  beneficiary)
    {
        if (msg.sender == files[_fileID].beneficiary)   
        {return (files[_fileID].IPFShash, files[_fileID].FileTopic,files[_fileID].sender, files[_fileID].beneficiary);
        //return files[_fileID].sender;
        //return files[_fileID].beneficiary;}
    } }
    
    function getMyFiles (uint _fileID) public view returns(string memory IPFShash, string memory FileTopic)
    {
        if (files[_fileID].beneficiary == msg.sender)
      {return (files[_fileID].IPFShash, files[_fileID].FileTopic);

         
     }
         else
        {}
    }
    function getIPFSfileTopic(uint vaultID) public view returns(string memory)
    {
        return files[vaultID].FileTopic;
    }

}
