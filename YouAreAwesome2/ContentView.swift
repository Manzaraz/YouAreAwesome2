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
    @State private var imageNumber = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You Are Awesome!",
                    message2 = "You Are Great!"
                    
//                var randomImage = "image\(Int.random(in: 0..<10))" // MARK: this is my resolution
//                imageName = randomImage
                                
                message = isActivated ? message1 : message2
                
                imageName = imageName == "image9" ? "image0" : "image\(imageNumber)"
                imageNumber = imageNumber == 9 ? 0 : imageNumber + 1
                
                isActivated.toggle()
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
