//
//  ProgressTrack.swift
//  WaterTracker
//
//  Created by Aisha Alnozili on 04/08/1445 AH.
//

import SwiftUI

struct ProgressTrack: View {
    @State private var progress: CGFloat = 0.7
    @State private var emojis = ["😴", "😃", "😁", "🥰", "🥳"]
    @State private var currentEmojiIndex: Int = 0
    
    func calculateWaterIntake() -> String {
        
        return ""
    }
    
    var body: some View {
        VStack {
            Text(" Today's Water Intake")
           
                .padding(.trailing,180)
                .foregroundColor(Color("grey2"))
                .offset(y: 60)
                .padding(.leading)
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 50.0)
                    .opacity(0.8)
                    .foregroundColor(Color.lightBlue2)
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 50.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.lightBlue)
                    .rotationEffect(Angle(degrees: -90))
                
                 Text(emojis[currentEmojiIndex])
                    .font(.system(size: 40))
                    .foregroundColor(Color.blue)
                    .offset(y: -160)
                    .rotationEffect(Angle(degrees: Double(progress * 360 - 3)))
                
            }
            .padding(40)
            
            Spacer()
            
            HStack(spacing: 40) {
                Button(action: {
                    withAnimation {
                        progress -= 0.1
                        if progress < 0.0 {
                            progress = 0.0
                            
                        }
            else{
                    currentEmojiIndex = Int(progress * CGFloat(emojis.count))
                        }
                        
                    }
                }) {
                    
                    HStack(spacing:180){
                        
                        ZStack {
                            Circle()
                                .fill(Color.grey3)
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.grey3, lineWidth: 0))
                            
                            Image(systemName: "minus")
                                .font(.system(size: 35))
                                .foregroundColor(.lightBlue)
                        }
                    
                    
                    Button(action: {
                        withAnimation {
                            progress += 0.1
                            if progress > 1.0 {
                                progress = 1.0
                            }
                            else{
                                currentEmojiIndex = Int(progress * CGFloat(emojis.count))
                            }
                        }
                    }) {
                        ZStack{
                            Circle()
                                .fill(Color.grey3)
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.grey3, lineWidth: 0))
                            
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                                .foregroundColor(.lightBlue)
                        }
                        //.padding(.leading)
                    }
                    
                }
       }
            }
            .padding()
        }
    }
}
    struct ProgressTrack_Previews: PreviewProvider {
        static var previews: some View {
            ProgressTrack()
            
}
        }
    






