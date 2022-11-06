# DevFest Challenge - FundMe Chain (Hard)

- [DevFest Challenge - FundMe Chain (Hard)](#devfest-challenge---fundme-chain-hard)
  - [Introduction](#introduction)
  - [Problem Statement](#problem-statement)
  - [Requirements](#requirements)
  - [Expectations](#expectations)
  - [Notes](#notes)
  - [Setup](#setup)

## Introduction
**Greetings! you made it so far here!** one more challenge on your way... seems very self-confident? ***careful!*** this one isn't like the others ;)
***Web3***, the World Wide Web based on blockchain technology which improved the most important thing missed on web2; *Privacy*; instead of a web monopolized by large technology companies which requires too much trust, Web3 enforces Decentralization and gives the power back to the users in form of ownership.

## Problem Statement
There're a lot of platforms out there that provide the possibility for individuals to publish their project ideas so others can fund them based on their interests.
Have you heard about Kickstarter? it's an American public benefit corporation that maintains a global crowdfunding platform to help bring projects to life. The most basic approach to funding a project is the following:

1. The Project's owner creates an announcement describing his project goals.
2. Possible funders read the project's announcement and decide whether or not to fund the project.
3. If a funder wants to donate to the project, he sends the money to the project's owner, and then the owner got benefited from the money and spends it to raise his project(or is supposed to do so!).

By reading the approach, did you notice something that may lead to _scam projects_? the third step is too risky, and it requires to  trust the project's owner to not spend money on something else, we need to solve that!
If the same approach would be applied on Web3, the scam risk would be reduced significantly, and you are asked to implement that!
To keep us on the scope of the project and not finding ourselves building something bigger(maybe DAO ?), we suppose that your smart contract represents the project, and it **_must implement the following functionalites_**:

1. If a funder wants to contribute to a project, he must send a sufficient amount of Ether(specified on [Notes](#notes)).
2. If the project's owner wants to spend money, he must create a request specifying necessary related information(specified on [Notes](#notes)).
3. The project's owner can finalize the request after **half of the contributors at least have voted for YES**.
   <br />
   > Always keep in mind that we're following a Decentralized approach, so the money must be stored somewhere safe(not sent directly to the owner's wallet) before the Request is finalized!

## Requirements

1. The smart contract must implement all the functionalities mentioned before.
2. The Hardhat framework must be kept and used during the development build(**switching to Truffle, using Moralis, or any other framework is strictly prohibited**).
3. **All tests written in the `./test` must pass**.
4. Hardhat comes with *Ethers.js*, and it **must be used** to interact with the smart contract.

## Expectations

- We expect a working solution that respects the requirements and is implemented in a user-friendly way that is visually appealing.

## Notes

- The sufficient amount of ether that must be sent to contribute to the project must be greater or equal to the minimum_amount (this constant must be initialized by the project's owner during the deployment of the contract).
- The Request structure is:
  - `Description`: String [Small description of why the need of spending a specific amount of money].
  - `amount` : uint [The amount of ether to be spent].
  - `recipient`: Payable address [The wallet that is going to receive the ether].
    > These are the required attributes, you can add more to help in the development of the solution(and you need to__*consider it as a hint ;)*).
- The solidity compiler is configured under the **0.8.17** version, feel free to change it to your preferred solidity version on `./hardhat.config.js`

- The compiled smart contracts will be generated inside `src/blockchain`, check the artifacts path inside `./hardhat.config.js`.
- You may use any CSS framework to implement the design.
- This challenge focuses more on writing the smart contract, testing it, and integrating it with the Front end, minimalistic design that implements the required functionalities is more than accepted.

## Setup

To get you started with this challenge, we have provided you with a starting point. so you need first to copy to your local environment the `starter` folder you see next to this challenge. and install all the dependencies:

```bash
cd starter
npm install
```

Happy coding!

**[⬆ back to top](#introduction)**