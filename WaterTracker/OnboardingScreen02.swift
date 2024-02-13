//
//  OnboardingScreen02.swift
//  WaterTracker
//
//  Created by Faizah Almalki on 03/08/1445 AH.
//

import SwiftUI

struct OnboardingScreen02: View {
        let litersOfWaterNeeded: Double = 2.4
        let cupsOfWaterNeeded: Int = 12

        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                
                Text("The needed water intake")
                    .font(.title)
                    .fontWeight(.bold)
                
                    .padding(.leading, -1)

                Text("Your body needs \(litersOfWaterNeeded, specifier: "%.1f") liters of hydration, which is equivalent to \(cupsOfWaterNeeded) cups")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.leading ,-1)
                    .padding(.trailing)

                HStack(spacing: 20) {
                    WaterMetricView(metricValue: "\(cupsOfWaterNeeded)", metricUnit: "cups", imageName: "takeoutbag.and.cup.and.straw")
                    WaterMetricView(metricValue: String(format: "%.1f L", litersOfWaterNeeded), metricUnit: "liters", imageName: "waterbottle")
                }
                .padding(.bottom, 180)
                
                Button(action: {
                }) {
                    Text("Set the notification")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.leading)
                .padding(.trailing)
                
                Spacer().frame(height: 50)
            }
            .padding()
        }
    }

    struct WaterMetricView: View {
        let metricValue: String
        let metricUnit: String
        let imageName: String
        
        var body: some View {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                
                Text(metricValue)
                    .font(.title)
                
                Text(metricUnit)
                    .font(.caption)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
    }

  
#Preview {
    OnboardingScreen02()
}
