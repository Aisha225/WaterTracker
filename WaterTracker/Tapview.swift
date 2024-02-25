import SwiftUI

extension View {
    func onPageControlColor(activeColor: UIColor, inactiveColor: UIColor) -> some View {
        self.onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = activeColor
            UIPageControl.appearance().pageIndicatorTintColor = inactiveColor
        }
    }
}

struct Tapview: View {
    @EnvironmentObject var user: User
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView {
            ProgressTrack()
                .environmentObject(user)
                .tag(0)
            
            Cups()
                .environmentObject(user) 
                .tag(1)

        }
        .tabViewStyle(.page)
        .onPageControlColor(activeColor: .lightBlue, inactiveColor: .color4 ) // يمكنك تغيير الألوان هنا حسب الحاجة
        
        // تحديث النص بناءً على الصفحة الحالية
          Text(textForSelectedTab(selectedTab))
              .foregroundColor(Color("grey2"))
              .font(.system(size: 10))
              .padding(.bottom)



      }
  }
  
  func textForSelectedTab(_ tab: Int) -> String {
      switch tab {
      case 0:
          return "Swipe right for liters calculating"
      case 1:
          return "Swipe left for liters calculating"
      default:
          return "صفحة غير معروفة"
      }
  
    }






struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
      Tapview()
    }
}
