//
//  DiceGameVM.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import Foundation

class DiceGameVM: ObservableObject {
    @Published private var model: DiceGameModel = DiceGameVM.createGame()
    @Published var rotation: Int = 0
    
    
    private static func createGame() -> DiceGameModel {
        return DiceGameModel(name: "Foo", bet: 50)
    }
    
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
    
    var bet: Int {
        if let unwrappedBet = model.bet { return unwrappedBet }
        else { return 50 }
    }
    
    var status: String? {
        if let status = model.status {
            switch status {
            case .win:
                return "win"
            case .lose:
                return "lose"
            }
        } else { return nil }
    }
    
    //MARK: - Intents
    func resetGame() {
        rotation = 0
        model = DiceGameVM.createGame()
    }
    
    func dropDices() {
        model.dropDices()
    }
    
    func makeBet(_ value: Int) {
        model.makeBet(value)
        model.status = nil
        rotation = 0
    }
}
