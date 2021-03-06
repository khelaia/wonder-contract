// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

interface IERC721Receiver {
    function onERC721Received(
        address _from,
        address _to,
        uint256 _tokenId,
        bytes calldata _data
    ) external returns (bytes4);
}