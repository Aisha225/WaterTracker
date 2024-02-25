import SwiftUI

struct Splash: View {
    @State private var offset: CGFloat = -30
    @State private var opacity: Double = 1.0
    @State private var timer: Timer?
    @State private var showContentView = false
    
    var body: some View {
        
        
        if showContentView {
            Cups()
        } else {
            ZStack {
                Color("white1")
                    .ignoresSafeArea()
                
                Image(systemName: "drop.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.lightblue)
                    .opacity(opacity)
                    .offset(y: offset)
                    .onAppear {
                        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                            withAnimation(.linear(duration: 0.1)) {
                                offset += 5
                                if offset > 200 {
                                    offset = -30
                                }
                                opacity -= 0.1
                                if opacity <= 0 {
                                    showContentView = true 
                                    timer?.invalidate()
                                }
                            }
                        }
                    }
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
