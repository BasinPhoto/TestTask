//
//  ContentView.swift
//  TestTask
//
//  Created by Sergey Basin on 26.03.2021.
//

import SwiftUI
import UserNotifications

struct DiceGameView: View {
    @ObservedObject var viewModel: DiceGameVM
    @StateObject var delegate = NotificationDelegate()
    
    @State var alert: Bool = false
    
    var body: some View {
        ZStack{
            BackgroundView(viewModel: viewModel)
            
            VStack{
                Button(action: {
                    viewModel.resetGame()
                    
                    let content = UNMutableNotificationContent()
                    content.title = "Game restarted"
                    content.subtitle = "Now you can start your game from begining!"
                    content.sound = UNNotificationSound.default
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                    
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
                    DropedDicesView(viewModel: viewModel, dice1Value: drawnNumber1,
                                    dice2Value: drawnNumber2)
                        .padding(.top, 30)
                }
                
                Spacer()
                
                MoneyBetView(viewModel: viewModel, money: viewModel.player.money, bet: viewModel.bet)
                    .padding(.bottom, 70)
                
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        viewModel.rotation += 360 * 6
                    }
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
        .onAppear(perform: {
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, . badge, .sound]) { (success, error) in
                    if success {
                        return
                    } else if let error = error {
                        print(error.localizedDescription)
                        alert.toggle()
                        
                    }
                }
            
            UNUserNotificationCenter.current().delegate = delegate
        })
        .alert(isPresented: $alert, content: {
            return Alert(title: Text("Notifications needed!"), message: Text("Please enable notification access in settings panel"), dismissButton: .cancel())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            DiceGameView(viewModel: DiceGameVM(), delegate: NotificationDelegate())
        }
    }
}
