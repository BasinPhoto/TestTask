//
//  BackgroundView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.01938241348, green: 0.4078606367, blue: 0.2234874368, alpha: 1))
            Image("diceTable")
                .resizable()
                .scaledToFit()
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
