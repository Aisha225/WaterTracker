import SwiftUI

struct Notification_Preferences_: View {
    @State private var startHour = Date()
    @State private var endHour = Date()
    @State private var selectedInterval: TimeInterval? 

    let intervals: [(time: TimeInterval, unit: String)] = [
        (15 * 60, "Mins"), (30 * 60, "Mins"),
        (60 * 60, "Mins"), (90 * 60, "Mins"),
        (2 * 3600, "Hours"), (3 * 3600, "Hours"),
        (4 * 3600, "Hours"), (5 * 3600, "Hours")
    ]

    var body: some View {
        VStack {
            Text("Notification Preferences")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.bottom, 50)

            Text("The start and End hour")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text("Specify the start and end date to receive the notifications")
                .font(.system(size: 16))
                .padding(.bottom, 20)
            VStack {
                DatePicker("Start hour", selection: $startHour, displayedComponents: .hourAndMinute)
                DatePicker("End hour", selection: $endHour, displayedComponents: .hourAndMinute)
            }
            .padding()
            .background(Color("grey1") )
            
            .cornerRadius(10)
            .padding([.leading, .trailing])

            Button(action: {
            }) {
                Text("Start")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("lightBlue"))
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing])
        }
        .padding()
    }
}

struct Notification_Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Notification_Preferences_()
    }
}
