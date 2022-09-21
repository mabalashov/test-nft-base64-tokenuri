// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol';
import 'base64-sol/base64.sol';
import "@openzeppelin/contracts/utils/Strings.sol";

contract Token is ERC721, Ownable{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyToken", "MTK") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function typeSubscription(uint256 tokenId) public view virtual returns (string memory)
    {
        return string.concat('typeSubscription', Strings.toString(tokenId));
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory)
    {
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{',
                                '"name": "test token ', Strings.toString(tokenId), '",',
                                '"description": "test token description",',
                                '"attributes": [',
                                    '{"typeSubscription": "', typeSubscription(tokenId), '"}',
                                ']'
                            '}'
                        )
                    )
                )
            )
        );
    }
}