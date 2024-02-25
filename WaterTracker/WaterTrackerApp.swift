import SwiftUI

@main
struct WaterTrackerApp: App {
    @StateObject private var user = User(weight: 80)

    init() {
        NotificationManager.instance.requestAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            Splash() 
                .environmentObject(user)
        }
    }
}
