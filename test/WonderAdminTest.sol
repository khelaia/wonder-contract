pragma solidity >=0.5.0 <0.6.0;
import "../WonderAdmin.sol";

contract WonderAdminTest is WonderAdmin {
  function test_getWonderCreatorFromArray(uint256 _index) public view returns (address) {
    return WonderCreators[_index];
  }

  function test_getWonderCreatorFromMapping(address _address) public view returns (uint256) {
    return addressToWonderCreatorId[_address];
  }

  function testOnlyWonderCreatorModifier() public view onlyWonderCreator returns (bool) {
    return true;
  }
}
