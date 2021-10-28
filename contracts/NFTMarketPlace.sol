// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.6;

contract NFTMarketPlace {
    // declaring variables

    string nameOfNFTPerson;
    string nameOfNFT;
    uint256 priceOfNFT;

    string candidateName;
    string GivenNFT;
    uint256 GivenownershipValue;

    // people who enlisted their NFTS

    struct EnlistPeople {
        string nameOfNFTPerson;
        string nameOfNFT;
        uint256 priceOfNFT;
    }

    // people who want to take GivenownershipValue

    struct MultiplePeople {
        string candidateName;
        string GivenNFT;
        uint256 GivenownershipValue;
    }

    // array for storing people who enlist their NFT

    EnlistPeople[] NFTpeople;

    // mapping NFT name with its price Of NFT
    mapping(string => uint256) public nameToNFT;

    // array for storing people who want to take half ownerships
    MultiplePeople[] candidates;

    // array for storing names of people who want ownership
    string[] NameOfCandidates;

    // function for getting and storing names of people,NFTS and price (people who enlisted)
    function EnlistPeopleAndNFT(
        string memory _nameOfNFTPerson,
        string memory _nameOfNFT,
        uint256 _priceOfNFT
    ) public {
        NFTpeople.push(EnlistPeople(_nameOfNFTPerson, _nameOfNFT, _priceOfNFT));
        nameToNFT[_nameOfNFT] = _priceOfNFT;
    }

    // function for getting and storing Candidates Names

    function CandidatesNames(string memory _candidateName) public {
        candidateName = _candidateName;
        NameOfCandidates.push(_candidateName);
    }

    // function for retrieve Candidate Name
    function retrieveCandidateName() public view returns (string[] memory) {
        return NameOfCandidates;
    }

    // function for selecting Candidates and giving them ownership
    function selectedCandidatesAndGivingOwnerShip(
        string memory _candidateName,
        string memory _GivenNFT,
        uint256 _GivenownershipValue
    ) public {
        require(_GivenownershipValue <= ((nameToNFT[_GivenNFT]) / 2));

        nameToNFT[GivenNFT] = nameToNFT[GivenNFT] - _GivenownershipValue;

        candidates.push(
            MultiplePeople(_candidateName, _GivenNFT, _GivenownershipValue)
        );
    }

    // showing NFT people name , NFTS and funds
    function showingOwnershipOfNFTPeople()
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        return (nameOfNFTPerson, nameOfNFT, priceOfNFT);
    }

    // showing candidates name , NFTS and funds

    function showingOwnershipOfMultiplePeople()
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        return (candidateName, GivenNFT, GivenownershipValue);
    }
}
