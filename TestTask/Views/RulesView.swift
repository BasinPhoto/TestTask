//
//  RulesView.swift
//  TestTask
//
//  Created by Sergey Basin on 29.03.2021.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.01938241348, green: 0.4078606367, blue: 0.2234874368, alpha: 1))
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 15) {
                Text("Rules")
                    .foregroundColor(.red)
                    .font(Font.system(size: 60, weight: .bold, design: .monospaced))
                Text("If summary dices value is:")
                Text("7 or 11 - WIN!")
                Text("2, 3 or 12 - LOSE")
                Text("otherwise - next turn.")
            }
            .foregroundColor(.yellow)
            .font(Font.system(size: 30, weight: .semibold, design: .monospaced))
            .padding()
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
