//
//  Drops.swift
//  WaterTracker
//
//  Created by Aisha Alnozili on 07/08/1445 AH.
//

import SwiftUI

class ResultStore: ObservableObject {
    @Published var clickCount: Int = 0
    var result: Double {
        Double(clickCount)
    }
}
struct Cups: View {
    @State private var filledStates = Array(repeating: false, count: 20)
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .foregroundColor(Color("grey2"))
                .offset(x: -90, y: 50)
                .padding(.leading)
            Text("\(user.currentWaterIntakeCups) cups / \(user.dailyWaterIntakeGoalCups) cups")
                .font(.title)
                .bold()
                .foregroundColor(Color("Black1"))
                .offset(x: -70, y: 50)
                .padding(.leading)
            
            
            
            
            
            ForEach(0..<5) { row in
                HStack(spacing: 55) {
                    ForEach(0..<4) { column in
                        DropZoneView(filledState: $filledStates[row * 4 + column])
                    }
                }
                
            }
            .padding()
            .padding(.bottom, 30.0)
            .offset(y: 65)

            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    struct DropZoneView: View {
        @Binding var filledState: Bool
          @EnvironmentObject var user: User
        
        var body: some View {
            VStack {
                Button(action: {
                           filledState.toggle()
                           if filledState {
                               user.addCup()
                           } else {
                               user.removeCup()
                           }
                       }) {
                    Image(filledState ? "drop" : "drop2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    
                }
                Text("1 cup")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
        }
        

        
    }
}
    struct Cups_Previews: PreviewProvider {
        static var previews: some View {
            Cups().environmentObject(User(weight: 70)) 
        }
    }
