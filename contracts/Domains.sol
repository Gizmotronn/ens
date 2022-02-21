// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    // Mapping data type to store names
    mapping(string => address) public domains;
    mapping(string => string) public emails;
    // Stores values
    mapping(string => string) public records;

    constructor() {
        console.log("Domains contract");
    }

    // Register function that adds names to mapping
    function register(string calldata name) public {
        // Check that the domain name is unregistered
        require(domains[name] == address(0));
        domains[name] = msg.sender;
        console.log("%s has registered a domain, ", msg.sender);
    }

    // Give the domain owners' address
    function getAddress(string calldata name) public view returns (address) {
        return domains[name];
    }

    function setRecord(string calldata name, string calldata record) public {
        // Check that the owner is the transaction sender (++ ^^)
        require(domains[name] == msg.sender);
        records[name] = record;
    }

    function getRecord(string calldata name)
        public
        view
        returns (string memory)
    {
        return records[name];
    }
}
