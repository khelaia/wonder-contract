pragma solidity ^0.5.12;
import "../WonderFactory.sol";

contract TestWonderFactory is WonderFactory {
    function setWonderToOwner(uint256 _WonderId, address _address) public {
        WonderToOwner[_WonderId] = _address;
    }

    function setOwnerWonderCount(address _address, uint256 _count) public {
        ownerWonderCount[_address] = _count;
    }

    function createWonder(
        uint256 _mumId,
        uint256 _dadId,
        uint256 _generation,
        uint256 _genes,
        address _owner
    ) public returns (uint256) {
        _createWonder(_mumId, _dadId, _generation, _genes, _owner);
    }

    function test_setGenZeroCounter(uint256 _value) public {
        _gen0Counter = _value;
    }

    function mixDna(uint256 _dadDna, uint256 _mumDna, uint256 _seed)
        public
        returns (uint256)
    {
        return _mixDna(_dadDna, _mumDna, _seed);
    }

    function getNow() public view returns (uint256) {
        return now;
    }

    function test_setWonderCooldownEnd(uint256 _WonderId, uint64 _unixTimeInSec) public {
        wonders[_WonderId].cooldownEndTime = _unixTimeInSec;
    }
}
