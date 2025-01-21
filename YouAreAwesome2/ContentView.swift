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
    @State private var imageNumber = 0
    @State private var messageIndex = 0
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
//                .lineLimit(4)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: imageName)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Press Me!") {
                let messages = ["Gadzooks my friend! I am astonished at how utterly magnificient you are!", "You Are Awesome!", "You Are Great!", "Fabulous? That's You!", "Swift Rules!", "When the Genius Needs Help, They Call You!"]
                
                message = messages[messageIndex]
                messageIndex = messageIndex == messages.count-1 ? 0 : messageIndex+1
                
                //                var randomImage = "image\(Int.random(in: 0..<10))" // MARK: this is my resolution
                //                imageName = randomImage
                
                imageName = "image\(imageNumber)"
                imageNumber = imageNumber == 9 ? 0 : imageNumber + 1
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
