//
//  DropedDicesView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

struct DropedDicesView: View {
    @ObservedObject var viewModel: DiceGameVM
    
    var dice1Value: Int
    var dice2Value: Int
    
    var body: some View {
        HStack{
            Group{
                Image(String(dice1Value))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .colorInvert()
                
                Text("\(dice1Value + dice2Value)")
                    .font(Font.system(size: 60, weight: .bold))
                    .foregroundColor(.yellow)
                    .frame(width: 100)
                
                Image(String(dice2Value))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .colorInvert()
            }
            .rotation3DEffect(
                Angle(degrees: Double(viewModel.rotation)),
                axis: (x: 1.0, y: 2.0, z: 3.0)
                )
        }
        .onAppear(perform: {
            withAnimation(Animation.easeOut(duration: 0.5)) {
                viewModel.rotation += 360 * 6
            }
        })
    }
}

struct DropedDicesView_Previews: PreviewProvider {
    static var previews: some View {
        DropedDicesView(viewModel: DiceGameVM(), dice1Value: 2, dice2Value: 3)
    }
}
