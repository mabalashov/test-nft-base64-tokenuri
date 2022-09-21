### Test NFT

Ensure we can use base64 encode to provide tokenURI

### Scripts:

npx hardhat run scripts/deploy.ts --network goerli

npx hardhat verify --network goerli <address>  --contract "contracts/Token.sol:Token"       
