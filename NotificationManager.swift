//
//  NotificationManager.swift
//  WaterTracker
//
//  Created by Faizah Almalki on 15/08/1445 AH.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification(startHour: Date, endHour: Date, interval: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.subtitle = "Hey there! It's time to hydrate. You're close to reaching today's water goal. Take a sip to stay on track!"

        content.sound = .default
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: startHour)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
