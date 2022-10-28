//give the contract SVG code
//output an NFT URI with this svg code
//storing all the NFT metadad on-chain
//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"
import "base64/base64-sol";

contract SVGNFT is ERC721URIStorage{
    
    uint256 public tokenCounter;
    constructor() ERC721("SVG NFT", "SVGNFT"){
        tokenCounter = 0;
        function creat (string memory svg) public {
            _safeMint(msg.sender, tokenCounter);
            string memory imageURI = svgToImageURI(svg);
            string memory tokenURI =formatTokenURI(imageURI);
            _setTokenURI(tokencounter,tokenURI);
            tokenCounter = tokenCounter + 1;
        }
        function svgToImafeURI(string memory svg ) public return (sting memory){
            //<svg <html xmlns="http://www.w3.org/2000/xhtml"> height="200" width="400"><path d="M150 0 L75 200 L225 200 Z" /></svg>

            //data:image/svg+xml;base64,<base65-encodingL
            string memory base Uri="data:image/svg+xml";
            string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
            //lonng 235erge534t3j5g8g.lonng 235erge534t3j5g8g....
            string memory imageURI = string(abi.encodePacked(baseURI,svgBase64Encoded));
            //data:image/svg+xml;base64,<base65-encodingL, lonng 235erge534t3j5g8g.
            return imageURI;
        function formatTokenURI(string memory imageURI) public pure return (string memory)
        {
            string memory baseURL = "data:application/json;base64";
            return string bytes(abi.encodePacked(
                baseURL,
                Base64.encode(
                bytes (abi.encodePacked('{"name":"SVG NFT","description":"An NFT based on SVG!",
                    "ttributes":"","image":"", imageURI,""}'
                )
            ))
                            ));
        }
    }


}