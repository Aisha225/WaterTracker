import SwiftUI

struct OnboardingScreen02: View {
    var litersOfWaterNeeded: Double
    var cupsOfWaterNeeded: Int

    var body: some View {
        NavigationView {

        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Text("The needed water intake")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.bottom, -10)

            Text("Your body needs \(litersOfWaterNeeded, specifier: "%.1f") liters of hydration, which is equivalent to \(cupsOfWaterNeeded) cups")
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 45)
                .foregroundColor(Color("grey2"))

            HStack(spacing: 20) {
                WaterMetricView(metricValue: "\(cupsOfWaterNeeded)", metricUnit: "cups", imageName: "takeoutbag.and.cup.and.straw")
                WaterMetricView(metricValue: String(format: "%.1f", litersOfWaterNeeded), metricUnit: "L", imageName: "waterbottle")
            }
            Spacer()
            Button(action: {
                
            }) {
                Text("Set the notification")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("lightBlue"))
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing])
            
            Spacer()
        }
        .offset(y: 30)
        .padding()
    } .navigationBarBackButtonHidden(true)
        
        }
}

struct OnboardingScreen02_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen02(litersOfWaterNeeded: 2.5, cupsOfWaterNeeded: 10)
    }
}
