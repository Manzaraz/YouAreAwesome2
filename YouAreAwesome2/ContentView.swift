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
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    

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
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0..<messages.count)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber


                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
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
