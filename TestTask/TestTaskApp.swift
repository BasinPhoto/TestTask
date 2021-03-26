//
//  TestTaskApp.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI

@main
struct TestTaskApp: App {
    let game = DiceGameVM()
    var body: some Scene {
        WindowGroup {
            DiceGameView(viewModel: game)
        }
    }
}
