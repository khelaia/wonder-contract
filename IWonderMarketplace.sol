pragma solidity ^0.5.0;

/*
 * Market place to trade wonders (should **in theory** be used for any ERC721 token)
 * It needs an existing Wonder contract to interact with
 * Note: it does not inherit from the Wonder contracts
 * Note: The contract needs to be an operator for everyone who is selling through this contract.
 */
interface IWonderMarketPlace {

    event MarketTransaction(string TxType, address owner, uint256 tokenId);

    /**
    * Set the current WonderContract address and initialize the instance of Wondercontract.
    * Requirement: Only the contract owner can call.
     */
    function setWonderContract(address _WonderContractAddress) external;

    /**
    * Get the details about a offer for _tokenId. Throws an error if there is no active offer for _tokenId.
     */
    function getOffer(uint256 _tokenId) external view returns ( address seller, uint256 price, uint256 index, uint256 tokenId, bool isSireOffer, bool active);

    /**
    * Get all tokenId's that are currently for sale. Returns an empty arror if none exist.
     */
    function getAllTokenOnSale() external view  returns(uint256[] memory listOfOffers);

    /**
     * Get all tokenId's with active sire offers.
     * Returns an empty array if none exist.
     */
    function getAllSireOffers() external view returns(uint256[] memory listOfOffers);

    /**
    * Creates a new offer for _tokenId for the price _price.
    * Emits the MarketTransaction event with txType "Create Offer"
    * Requirement: Only the owner of _tokenId can create an offer.
    * Requirement: There can only be one active offer for a token at a time.
    * Requirement: Marketplace contract (this) needs to be an approved operator when the offer is created.
     */
    function setOffer(uint256 _price, uint256 _tokenId) external;

    /**
     * Creates a new siring offer for @param _tokenId at @param _price
    * Emits the MarketTransaction event with txType "Sire Offer"
    * Requirement: The sire must be ready to breed
    * Requirement: Only the owner of _tokenId can create an offer.
    * Requirement: There can only be one active offer for a token at a time.
    * Requirement: Marketplace contract (this) needs to be an approved operator when the offer is created.
     */
    function setSireOffer(uint256 _price, uint256 _tokenId) external;

    /**
    * Removes an existing offer.
    * Emits the MarketTransaction event with txType "Remove Offer"
    * Requirement: Only the seller of _tokenId can remove an offer.
     */
    function removeOffer(uint256 _tokenId) external;

    /**
    * Executes the purchase of _tokenId.
    * Sends the funds to the seller and transfers the token using transferFrom in Wondercontract.
    * Emits the MarketTransaction event with txType "Buy".
    * Requirement: The msg.value needs to equal the price of _tokenId
    * Requirement: There must be an active offer for _tokenId
     */
    function buyWonder(uint256 _tokenId) external payable;

    /**
     * Purchase of siring rites
     * Sends funds to the seller and sets sire approval for the matron
     * Emits a MarketTransaction event with TxType "Sire Rites"
     * Requirement: The msg.value needs to equal the siring price of _tokenId
     * Requirement: There must be an active sire offer for _sireTokenId
     */
    function buySireRites(uint256 _sireTokenId, uint256 _matronTokenId) external payable;
}
