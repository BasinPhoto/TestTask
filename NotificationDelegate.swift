//
//  NotificationDelegate.swift
//  TestTask
//
//  Created by Sergey Basin on 29.03.2021.
//

import Foundation
import UserNotifications

class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .sound])
    }
}
