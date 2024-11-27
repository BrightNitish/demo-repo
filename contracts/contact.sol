// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Contact {
    address owner;
    string[] names;
    string[] mobiles;
    string[] emails;
    string[] organizations;
    mapping(string => bool) _contacts;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender, "Only the owner can perform this action");
        _;
    }

    function insertContact(
        string memory name,
        string memory mobile,
        string memory email,
        string memory org
    ) public onlyOwner {
        require(!_contacts[mobile], "Contact with this mobile already exists");
        names.push(name);
        mobiles.push(mobile);
        emails.push(email);
        organizations.push(org);
        _contacts[mobile] = true;
    }

    function viewContacts()
        public
        view
        returns (
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory
        )
    {
        return (names, mobiles, emails, organizations);
    }
}
