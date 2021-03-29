//
//  TestTaskApp.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI
import FBSDKCoreKit
import Firebase

@main
struct TestTaskApp: App {
    init() {
        FirebaseApp.configure()
    }
    let game = DiceGameVM()
    var body: some Scene {
        WindowGroup {
            DiceGameView(viewModel: game)
        }
    }
}
