# Amun solidity/vyper engineer task

An exercise in implementing smart contract logic

## How to use it:

- `$ npm install`

This repo uses [buidler](https://buidler.dev/). Feel free to use it to as template for your task.

1. Fork this repo
2. Work on one of the tasks
3. Create a pull request and add Amun engineers as reviewers

Tasks (Choose one):

A. Create a ERC20 tokens smart contract portfolio

- User is able to add, remove, show list of tokens with their balances
- Be able to transfer tokens for the user from the portifolio smart contract
- Bonus: emergency withdraw all tokens

B. Build a token fund.

This fund works as following.

- When a user deposits USDC or USDT to this fund it gets the user 50% of LINK and 50% of WETH.

- When user withdraws from the fund there is a 10% fee on the profit the fund made for them. Otherwise there is no fee.

- Bonus: Connect the smart contract you create at least to two Dexes, for example Uniswap or Kyber, so as to get the best price when coverting stable coin to LINK or WETH.
