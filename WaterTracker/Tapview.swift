//
//  Tapview.swift
//  WaterTracker
//
//  Created by Aisha Alnozili on 08/08/1445 AH.
//

import SwiftUI

struct Tapview: View {
    var body: some View {
        TabView {
            ProgressTrack()//.environmentObject(User())
                        OnboardingPage(title: "Explore", image: "explore_image")
       ProgressTrack()
            Cups()
            
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingPage: View {
    let title: String
    let image: String

    var body: some View {
        VStack {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Image(image)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
      Tapview()
    }
}
