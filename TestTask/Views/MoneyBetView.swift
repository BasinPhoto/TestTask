//
//  MoneyBetView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

struct MoneyBetView: View {
    @ObservedObject var viewModel: DiceGameVM
    var money: Int
    @State var bet: Int
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Money:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
                Text("$\(money)")
                    .font(Font.system(size: 35, weight: .heavy))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
            .padding()
            
            Spacer ()
            
            VStack(alignment: .trailing) {
                Stepper("\(bet)", value: $bet, in: 50...viewModel.player.money, step: 50)
                    .fixedSize(horizontal: true, vertical: false)
                    .font(Font.system(size: 35, weight: .bold))
                    .foregroundColor(.yellow)
                    .disabled(viewModel.betSetted)
                
                Button(action: {
                    viewModel.makeBet(bet)
                }, label: {
                    Text("BET")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.yellow)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .opacity(viewModel.betSetted ? 0.5 : 1)
                .disabled(viewModel.betSetted)
            }
            .padding()
        }
    }
}

struct MoneyBetView_Previews: PreviewProvider {
    static var previews: some View {
        let game = DiceGameVM()
        MoneyBetView(viewModel: game, money: 150, bet: 50)
    }
}
