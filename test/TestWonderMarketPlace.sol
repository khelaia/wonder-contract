pragma solidity ^0.5.12;
import "../WonderMarketplace.sol";

contract TestWonderMarketPlace is WonderMarketPlace {
    constructor(address _WonderContractAddress)
        public
        WonderMarketPlace(_WonderContractAddress)
    {}

    function getWonderContractAddress() public view returns (address addr) {
        return address(_WonderContract);
    }

    function test_createOffer(
        address payable _seller,
        uint256 _price,
        uint256 _tokenId,
        bool _isSireOffer,
        bool _active
    ) public {
        Offer memory newOffer = Offer(
            _seller,
            _price,
            0,
            _tokenId,
            _isSireOffer,
            _active
        );
        uint256 index = offers.push(newOffer) - 1;
        offers[index].index = index;

        tokenIdToOffer[_tokenId] = offers[index];
    }
}
