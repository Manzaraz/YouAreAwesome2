//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Christian Manzaraz on 18/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var isActivated = false
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.primary)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                
                if !isActivated {
                    message = message1
                    imageName = "sun.max.fill"
                } else {
                    message = message2
                    imageName = "hand.thumbsup"
                }
                isActivated.toggle()
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
