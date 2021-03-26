//
//  DiceGameVM.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import Foundation

class DiceGameVM: ObservableObject {
    @Published private var model: DiceGameModel = DiceGameVM.createGame()
    
    //MARK: - Access to the model
    var player: DiceGameModel.Player {
        model.player
    }
    
    var betSetted: Bool {
        return model.bet != nil
    }
    
    var drawnNumbers: (Int?, Int?) {
        return model.drawnNumbers
    }
    
    private static func createGame() -> DiceGameModel {
        return DiceGameModel(name: "Foo", bet: 50)
    }
    
    //MARK: - Intents
    func resetGame() {
        model = DiceGameVM.createGame()
    }
    
    func dropDices() {
        model.dropDices()
    }
    
    func makeBet(_ value: Int) {
        model.makeBet(value)
    }
}
