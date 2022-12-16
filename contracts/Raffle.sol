// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

error Raffle__notEnoughETHENtered();

contract Raffle {
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterTaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__notEnoughETHENtered();
        }
        s_players.push(payable(msg.sender));
    }

    // function pickRandomWinner() {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayers(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
