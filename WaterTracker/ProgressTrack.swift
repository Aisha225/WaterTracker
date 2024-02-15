import SwiftUI

struct ProgressTrack: View {
    @ObservedObject var user: User
    
    private var progress: CGFloat {
        max(CGFloat(user.currentWaterIntake / user.dailyWaterIntakeGoal), 0)
    }
    
    private var currentEmoji: String {
        if progress >= 1.0 {
            return "🥳"
        } else {
            let emojis = ["😴", "😃", "😁", "🥰"]
            let progressPercentage = Int(progress * CGFloat(emojis.count))
            return emojis[min(progressPercentage, emojis.count - 1)]
        }
    }
    
    func updateWaterIntake(increment: Bool) {
        withAnimation {
            let incrementAmount: Double = user.dailyWaterIntakeGoal * 0.1
            if increment {
                user.addWaterIntake(amount: incrementAmount)
            } else if user.currentWaterIntake > 0 {
                user.addWaterIntake(amount: -incrementAmount)
            }
        }
    }

    var body: some View {
        VStack {
            
            
            Text("Today's Water Intake")
//                          .padding(.trailing, 180)
                          .foregroundColor(Color("grey2"))
                          .offset(x: -90, y: 60)
                          .padding(.leading)
                      Text("\(String(format: "%.1f", user.currentWaterIntake)) liter / \(String(format: "%.1f", user.dailyWaterIntakeGoal)) liter")
                .font(.title)
                .bold()
            

                .foregroundColor(.black)
                .offset(x: -70, y: 65)
                          .padding(.leading)
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 50.0)
                    .opacity(0.8)
                    .foregroundColor(Color.lightBlue2)
                
                Circle()
                    .trim(from: 0.0, to: min(progress, 1.0))
                    .stroke(style: StrokeStyle(lineWidth: 50.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.lightBlue)
                    .rotationEffect(Angle(degrees: -90))
                
                Text(currentEmoji)
                    .font(.system(size: progress >= 1.0 ? 60 : 40))
                    .foregroundColor(Color.lightBlue2)
                    .offset(y: progress >= 1.0 ? 0 : -160) // عند اكتمال الهدف، يظهر الإيموجي في المنتصف
                    .rotationEffect(Angle(degrees: progress < 1.0 ? Double(progress * 360) : 0))
                    
            }
            .padding(40)
            
            Spacer()
            
            HStack(spacing: 90) {
                Button(action: {
                    withAnimation {
                        updateWaterIntake(increment: false)
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(user.currentWaterIntake > 0 ? Color.grey3 : Color("grey1")) // تغيير لون الزر عندما تكون القيمة صفر
                            .frame(width: 50, height: 50)
                            .overlay(Circle().stroke(Color.grey3, lineWidth: 0))
                        
                        Image(systemName: "minus")
                            .font(.system(size: 35))
                            .foregroundColor(user.currentWaterIntake > 0 ? Color.lightBlue : Color("grey2"))
                    }
                }.disabled(user.currentWaterIntake <= 0 && user.currentWaterIntake == 0) // تعطيل الزر عندما تكون القيمة صفر
                
                Text("\(String(format: "%.1f", user.currentWaterIntake))")
                    .font(.title)
                    .bold()
                
                Button(action: {
                    withAnimation {
                        updateWaterIntake(increment: true)
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
                }
            }
            .padding()
            .offset(y: -75)
            
        }
    }
}

struct ProgressTrack_Previews: PreviewProvider {
    static var previews: some View {
        let userSample = User(weight: 80)
        ProgressTrack(user: userSample)
    }
}








