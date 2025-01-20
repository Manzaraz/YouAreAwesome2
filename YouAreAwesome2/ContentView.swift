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
    @State private var isActivated = true
    
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
                let message1 = "You Are Awesome!",
                    message2 = "You Are Great!",
                    imageName1 = "sun.max.fill",
                    imageName2 = "hand.thumbsup"
                
                message = isActivated ? message1 : message2
                imageName = isActivated ? imageName1 : imageName2
                
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
