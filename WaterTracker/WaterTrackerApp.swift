//
//  WaterTrackerApp.swift
//  WaterTracker
//
//  Created by Aisha Alnozili on 03/08/1445 AH.
//

import SwiftUI

@main

struct WaterTrackerApp: App {
    @StateObject private var user = User(weight: 80) // Example initial weight, adjust as needed.
    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted: Bool = false

    var body: some Scene {
        WindowGroup {
            Splash()
                .environmentObject(user)
        }
    }
}
