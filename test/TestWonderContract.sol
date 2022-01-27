pragma solidity ^0.5.12;
import "../WonderContract.sol";

contract TestWonderContract is WonderContract {
    event Test(uint256 message);

    function setWonderToOwner(uint256 _WonderId, address _address) public {
        WonderToOwner[_WonderId] = _address;
    }

    function setOwnerWonderCount(address _address, uint256 _count) public {
        ownerWonderCount[_address] = _count;
    }

    function addWonder(
        uint256 _mumId,
        uint256 _dadId,
        uint256 _generation,
        uint256 _genes,
        uint256 _cooldownIndex,
        address _owner
    ) public {
        Wonder memory newWonder = Wonder({
            name:'',
            genes: _genes,
            birthTime: uint64(now),
            cooldownEndTime: uint64(now),
            mumId: uint32(_mumId),
            dadId: uint32(_dadId),
            generation: uint16(_generation),
            cooldownIndex: uint16(_cooldownIndex)
        });
        uint256 id = wonders.push(newWonder) - 1;
        WonderToOwner[id] = _owner;
        ownerWonderCount[_owner] += 1;
    }
}
