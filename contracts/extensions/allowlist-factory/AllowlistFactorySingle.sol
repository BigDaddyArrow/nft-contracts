// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/proxy/Clones.sol";

import "./AllowlistSingle.sol";

contract AllowlistFactorySingle {

    event ContractDeployed(
        address indexed deployedAddress,
        address indexed nft,
        address indexed owner,
        string title
    );

    address public immutable implementation;

    constructor() {
        implementation = address(new AllowlistSingle());
    }

    function createAllowlist(
        string memory title,
        address nft,
        bytes32 root,
        uint256 price,
        uint256 maxPerAddress,
        bool startSale
    ) external returns (address) {

        address payable clone = payable(Clones.clone(implementation));

        AllowlistSingle list = AllowlistSingle(clone);

        list.initialize(title, nft, root, price, maxPerAddress);

        if (startSale) {
            list.startSale();
        }

        list.transferOwnership(msg.sender);

        emit ContractDeployed(clone, nft, msg.sender, title);

        return clone;

    }
}
