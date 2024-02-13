//
//  ContentView.swift
//  WaterTracker
//
//  Created by Aisha Alnozili on 03/08/1445 AH.
//
import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Image("drop")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 5)
                
                Text("iHydrate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Text("Start with iHydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 2) {
                    ZStack(alignment: .leading) {
                        HStack {
                            Text("Body weight")
                                .foregroundColor(.black)
                            Text("weight")
                                .foregroundColor(.gray)
                                .opacity(userInput.isEmpty ? 1.0 : 0.5)
                            Text("Kg")
                                .foregroundColor(.black)
                        }
                        TextField("", text: $userInput, onEditingChanged: { _ in }) {
                            
                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                        .opacity(userInput.isEmpty ? 0.5 : 1.0)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.bottom, 8)
                    
                    Spacer()
                    
                    Button(action: {
                        print("tap")
                    }) {
                        Text("Calculate Now  ")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(userInput.isEmpty ? Color.gray.opacity(0.5) : Color.lightBlue)
                            .cornerRadius(10)
                    }
                    .disabled(userInput.isEmpty)
                    .padding(.leading)
                    .padding(.trailing)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
