//
//  DiceGameModel.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import Foundation

struct DiceGameModel {
    
    struct Player {
        var name: String
        var money: Int = 500
    }
    
    enum turnStatus {
        case win
        case lose
    }
    
    var player: Player
    let dices: [String] = ["1", "2", "3", "4", "5", "6"]
    var dropResult: Int?
    var bet: Int?
    var drawnNumbers: (Int?, Int?)
    var status: turnStatus?
    
    init(name: String, bet: Int) {
        self.player = Player(name: name)
    }

    mutating func dropDices() {
        drawnNumbers.0 = Int.random(in: 1...6)
        drawnNumbers.1 = Int.random(in: 1...6)
        checkResult()
    }
    
    mutating private func checkResult() {
        let result = drawnNumbers.0! + drawnNumbers.1!
        switch result {
        case 7, 11:
            winCase()
        case 2, 3, 12:
            loseCase()
        default:
            break
        }
    }
    
    mutating private func winCase() {
        player.money += bet!
        status = .win
        nextBet()
    }
    
    mutating private func loseCase() {
        player.money -= bet!
        status = .lose
        nextBet()
    }
    
    mutating private func nextBet () {
        bet = nil
    }
    
    mutating func makeBet(_ value: Int) {
        bet = value
    }

}
