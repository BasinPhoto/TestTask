//
//  ContentView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

struct DiceGameView: View {
    @ObservedObject var viewModel: DiceGameVM
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Button(action: {
                    viewModel.resetGame()
                }, label: {
                    Text("New Game")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.yellow)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .padding()
    
                if let drawnNumber1 = viewModel.drawnNumbers.0,
                   let drawnNumber2 = viewModel.drawnNumbers.1 {
                    DropedDicesView(dice1Value: drawnNumber1,
                                    dice2Value: drawnNumber2)
                        .padding(.top, 50)
                }
                
                Spacer()
                
                MoneyBetView(viewModel: viewModel, money: viewModel.player.money, bet: viewModel.bet ?? 50)
                    .padding(.bottom, 70)
                
                Button(action: {
                    viewModel.dropDices()
                }, label: {
                    Text("Drop Dices!")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.yellow)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .padding()
                .opacity(!viewModel.betSetted ? 0.5 : 1)
                .disabled(!viewModel.betSetted)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = DiceGameVM()
        return Group {
            DiceGameView(viewModel: game)
        }
    }
}
