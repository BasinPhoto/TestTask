//
//  DropedDicesView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

struct DropedDicesView: View {
    var dice1Value: Int
    var dice2Value: Int
    
    var body: some View {
        HStack{
            Group{
                Image(String(dice1Value))
                    .resizable()
                Image(String(dice2Value))
                    .resizable()
            }
            .frame(width: 100, height: 100)
            .colorInvert()
        }
    }
}

struct DropedDicesView_Previews: PreviewProvider {
    static var previews: some View {
        DropedDicesView(dice1Value: 2, dice2Value: 3)
    }
}
