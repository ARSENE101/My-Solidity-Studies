# My Solidity Studies

This repository documents my hands-on journey into Solidity,
Ethereum/EVM development, and Web3 engineering.

The projects and exercises in this repository are based on
resources I studied, particularly material from @cryfin,
which I have implemented, modified, and extended while learning.

## Learning Journey

### Phase 1 — Solidity Fundamentals (Remix)

The following contracts were developed and experimented with
using Remix IDE:

- [SimpleStorage.sol](./SimpleStorage.sol)
  - State variables
  - Functions
  - Structs
  - Arrays
  - Mappings

- [StorageFactory.sol](./StorageFactory.sol)
  - Contract deployment from another contract
  - Contract addresses
  - Interfaces / ABI interaction
  - Contract-to-contract communication

- [FundMe.sol](./FundMe.sol)
  - Payable functions
  - `msg.sender`
  - `msg.value`
  - Chainlink price feeds
  - ETH/USD conversion
  - Funding logic

- [PriceConverter.sol](./PriceConverter.sol)
  - Libraries
  - Chainlink AggregatorV3Interface
  - Price conversion

- [AddFiveStorage.sol](./AddFiveStorage.sol)
  - Contract inheritance
  - Function overriding

- [FallbackExample.sol](./FallbackExample.sol)
  - `fallback()`
  - `receive()`
  - ETH transfers and contract behavior

### Phase 2 — Foundry

Beginning my transition from Remix to Foundry for
professional Solidity development workflows.

Topics will include:

- Project structure
- Compilation
- Testing
- Local blockchain development
- Deployment scripts
- Contract interaction
- Debugging
- Foundry tooling (`forge`, `cast`, `anvil`)
