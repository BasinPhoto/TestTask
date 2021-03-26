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
        var money: Int = 1000
    }
    
    var player: Player
    let dices: [String] = ["1", "2", "3", "4", "5", "6"]
    var dropResult: Int?
    var bet: Int?
    var drawnNumbers: (Int?, Int?)
    
    init(name: String, bet: Int) {
        self.player = Player(name: name)
    }

    mutating func dropDices() {
        drawnNumbers.0 = Int.random(in: 1...6)
        drawnNumbers.1 = Int.random(in: 1...6)
        print(drawnNumbers)
    }
    
    mutating func makeBet(_ value: Int) {
        bet = value
    }

}
