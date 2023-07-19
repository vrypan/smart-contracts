// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import { IAccessControl } from "lib/openzeppelin-contracts/contracts/access/IAccessControl.sol";
import { IERC721Enumerable } from "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Enumerable.sol";

interface IWeatherStationXM is IAccessControl, IERC721Enumerable {
  /**
   * @dev Custom errors
   */
  error PubKeyAlreadyExists();
  error SerialNumAlreadyExists();
  error TokenDoesNotExist();

  /**
   * @dev Emitted when manufacturer burns onboarding fee and mints an NFT per station
   * This event contains the origin caller address and the token ID for the NFT
   */
  event WeatherStationOnboarded(address indexed to, uint256 tokenId);
  /**
   * @dev Emitted when a user claims a weather station and its NFT
   * This event contains the origin caller address and the token ID for the NFT in focus
   */
  event WeatherStationClaimed(address indexed from, uint256 tokenId);
  /**
   * @dev Emitted when a user burns the NFT and this actions is triggered when the weather station is removed from network
   * This event contains the origin caller address and the token ID for the NFT in focus
   */
  event WeatherStationBurned(address indexed from, uint256 tokenId);

  //NFTs actions
  function mintWeatherStation(
    address recipient,
    string memory serialNum,
    string memory model,
    address pubKey,
    string memory image,
    string memory stationMetadata
  ) external returns (bool);
}
