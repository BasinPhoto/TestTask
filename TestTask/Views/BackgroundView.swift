//
//  BackgroundView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

struct BackgroundView: View {
    @ObservedObject var viewModel: DiceGameVM
    @State private var showWebView: Bool = false
    @State private var showRules: Bool = false
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.01938241348, green: 0.4078606367, blue: 0.2234874368, alpha: 1))
            Image("diceTable")
                .resizable()
                .scaledToFit()
                .blur(radius: viewModel.status == nil ? 0 : 5)
                .animation(Animation.linear.speed(3))
                .onTapGesture {
                    showRules = true
                }
                .sheet(isPresented: $showRules, content: {
                    RulesView()
                })
            
            if let status = viewModel.status {
                Image(status)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        showWebView.toggle()
                    }
                    .sheet(isPresented: $showWebView, content: {
                        WebView(url: URL(string: "https://apple.com"))
                    })
            }
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        let game = DiceGameVM()
        BackgroundView(viewModel: game)
    }
}
