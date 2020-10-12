# PaulRBerg's Contracts [![Coverage Status](https://coveralls.io/repos/github/paulrberg/paulrberg-contracts/badge.svg?branch=develop)](https://coveralls.io/github/paulrberg/paulrberg-contracts?branch=develop) [![Styled with Prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg)](https://prettier.io) [![Commitizen Friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Off-the-shelf Solidity smart contracts.** Built with my beloved [Solidity template](https://github.com/PaulRBerg/solidity-template).

- Compatible with Solidity ^0.7.x
- Complementary to [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- Tested with [Buidler](https://github.com/nomiclabs/buidler) and [Waffle](https://github.com/EthWorks/Waffle)
- Using
  [CarefulMath.sol](https://github.com/compound-finance/compound-protocol/blob/v2.8.1/contracts/CarefulMath.sol) instead
  of [SafeMath.sol](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.2.0/contracts/math/SafeMath.sol) (see
  rationale [here](https://twitter.com/PaulRBerg/status/1294398438654857217))
- Using [Exponential.sol](https://github.com/compound-finance/compound-protocol/blob/v2.8.1/contracts/Exponential.sol)
  for fixed-point math

I created this library for my own use, to avoid having to maintain the same contracts in different repositories. If
you find it useful too, that's a win for the both of us!

## Caveat

This is experimental, beta software and is provided on an "as is" and "as available" basis. I do not give any warranties and will not be liable for any loss, direct or indirect through continued use of this codebase.

## Installation

With yarn:

```sh
$ yarn add @paulrberg/contracts
```

Or npm:

```sh
npm install @paulrberg/contracts
```

I adhere to [Semantic Versioning](https://semver.org/), which means that your contracts won't break unexpectedly when upgrading to a newer minor version.

## Usage

Once installed, you can use the contracts in the library by importing them:

```solidity
pragma solidity ^0.7.0;

import "@paulrberg/contracts/math/CarefulMath.sol";
import "@paulrberg/contracts/token/erc20/Erc20.sol";
import "@paulrberg/contracts/token/erc20/Erc20Permit.sol";

contract MyToken is CarefulMath, Erc20, Erc20Permit {
  constructor(
    string memory name_,
    string memory symbol_,
    uint8 decimals_
  ) Erc20(name_, symbol_, decimals_) {}
}

```

## Contributing

### Pre Requisites

Before running any command, make sure to install dependencies:

```sh
$ yarn install
```

### Compile

Compile the smart contracts with Buidler:

```sh
$ yarn compile
```

### Build

Compile the smart contracts and generate TypeChain artifacts:

```sh
$ yarn build
```

### Lint Solidity

Lint the Solidity code:

```sh
$ yarn lint:sol
```

### Lint TypeScript

Lint the TypeScript code:

```sh
$ yarn lint:ts
```

### Test

Run the Mocha tests:

```sh
$ yarn test
```

### Coverage

Generate the code coverage report:

```sh
$ yarn coverage
```

### Clean

Delete the smart contract artifacts, the coverage reports and the Buidler cache:

```sh
$ yarn clean
```

## Security

While I set a high bar for code quality and coverage, do not assume that this library is completely safe to use. The contracts
have not been audited by any professional security researcher.

If you find any security issues, you can report them via [Keybase](https://keybase.io/paulrberg).

## Acknowledgements

I am grateful to the authors of existing related projects where I drew inspiration from:

- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Compound Protocol's Math Contracts](https://github.com/compound-finance/compound-protocol)
- [Alberto Cuesta Cañada's Erc20Permit and Orchestrated](https://github.com/albertocuestacanada)

## License

The contracts are released under the [MIT License](./LICENSE.md).
