// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/Proxy.sol";
import "@openzeppelin/contracts/utils/Address.sol";

import "./interfaces/IMetaverseNFT.sol";

/**
 * @title made by buildship.xyz
 * @dev ERC721XYz is extendable implementation of ERC721 based on ERC721A and MetaverseNFT.
 */

//      Want to launch your own collection?
//        Check out https://buildship.xyz

//                                    ,:loxO0KXXc
//                               ,cdOKKKOxol:lKWl
//                            ;oOXKko:,      ;KNc
//                         ox0X0d:           cNK,
//                      ;xXX0x:              dWk
//            ,cdO0KKKKKXKo,                ,0Nl
//         ;oOXKko:,;kWMNl                  dWO'
//      ,o0XKd:'    oNMMK:                 cXX:
//   'ckNNk:       ;KMN0c                 cXXl
//  'OWMMWKOdl;     cl;                  oXXc
//   ;cclldxOKXKkl,                    ;kNO;
//            ;cdk0kl'             ;clxXXo
//                ':oxo'         c0WMMMMK;
//                    :l:       lNMWXxOWWo
//                      ';      :xdc' :XWd
//             ,                      cXK;
//           ':,                      xXl
//           ;:      '               o0c
//           ;c;,,,,'               lx;
//            '''                  cc
//                                ,'
contract ERC721XYZ is Proxy {
    address internal constant proxyImplementation =
        0xe7c721B7CB5Fb2E47E01dE0D19d3385d6b13B87d;

    constructor(
        string memory name,
        string memory symbol,
        uint256 maxSupply,
        uint256 nReserved,
        bool startAtOne,
        string memory uri,
        MintConfig memory configValues
    ) {
        Address.functionDelegateCall(
            proxyImplementation,
            abi.encodeWithSelector(
                IMetaverseNFTImplementation.initialize.selector,
                name,
                symbol,
                maxSupply,
                nReserved,
                startAtOne,
                uri,
                configValues
            )
        );
    }

    // function config(
    //     uint256 price,
    //     uint256 maxTokensPerMint,
    //     uint256 maxTokensPerWallet,
    //     uint256 royaltyFee,
    //     address payoutReceiver,
    //     bool shouldLockPayoutReceiver,
    //     bool shouldStartSale,
    //     bool shouldUseJsonExtension
    // ) internal pure returns (MintConfig memory) {
    //     return
    //         MintConfig({
    //             publicPrice: price,
    //             maxTokensPerMint: maxTokensPerMint,
    //             maxTokensPerWallet: maxTokensPerWallet,
    //             royaltyFee: royaltyFee,
    //             payoutReceiver: payoutReceiver,
    //             shouldLockPayoutReceiver: shouldLockPayoutReceiver,
    //             shouldStartSale: shouldStartSale,
    //             shouldUseJsonExtension: shouldUseJsonExtension
    //         });
    // }

    function implementation() public pure returns (address) {
        return _implementation();
    }

    function _implementation() internal pure override returns (address) {
        return address(proxyImplementation);
    }
}
