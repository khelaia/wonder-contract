// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import "./Ownable.sol";

contract WonderAdmin is Ownable {
    mapping(address => uint256) addressToWonderCreatorId;
    address[] WonderCreators;

    event WonderCreatorAdded(address creator);
    event WonderCreatorRemoved(address creator);

    constructor()  {
        // placeholder to reserve ID zero as an invalid value
        _addWonderCreator(address(0));

        // the owner should be allowed to create wonders
        _addWonderCreator(owner());
    }

    modifier onlyWonderCreator() {
        require(isWonderCreator(msg.sender), "must be a Wonder creator");
        _;
    }

    function isWonderCreator(address _address) public view returns (bool) {
        return addressToWonderCreatorId[_address] != 0;
    }

    function addWonderCreator(address _address) external onlyOwner {
        require(_address != address(this), "contract address");
        require(_address != address(0), "zero address");

        _addWonderCreator(_address);
    }

    function _addWonderCreator(address _address) internal {
        addressToWonderCreatorId[_address] = WonderCreators.length;
        WonderCreators.push(_address);

        emit WonderCreatorAdded(_address);
    }

    function removeWonderCreator(address _address) external onlyOwner {
        uint256 id = addressToWonderCreatorId[_address];
        delete addressToWonderCreatorId[_address];
        delete WonderCreators[id];

        emit WonderCreatorRemoved(_address);
    }

    function getWonderCreators() external view returns (address[] memory) {
        return WonderCreators;
    }
}