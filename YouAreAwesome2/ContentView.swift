//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Christian Manzaraz on 18/01/2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    @State private var soundIsOn = true
    
    let numberOfImages = 9
    let numberOfSounds = 6

    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: imageName)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Divider()
                .padding()
            
            HStack {
                Group {
                    Text("Sound is \(soundIsOn ? "On" : "Off"):")
                    Toggle("", isOn: $soundIsOn)
                        .labelsHidden()
                        .onChange(of: soundIsOn) { oldValue, newValue in
                            if audioPlayer != nil && audioPlayer.isPlaying {
                                audioPlayer.stop()                                
                            }
                        }
                    
                }
                
                Spacer()
                
                Button("Press Me!") {
                    let messages = ["Gadzooks my friend! I am astonished at how utterly magnificient you are!", "You Are Awesome!", "You Are Great!", "Fabulous? That's You!", "Swift Rules!", "When the Genius Needs Help, They Call You!"]
                    
                    lastMessageNumber = nonRepeatingRandom(
                        lastNumber: lastMessageNumber,
                        upperBounds: messages.count-1
                    )
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(
                        lastNumber: lastImageNumber,
                        upperBounds: numberOfImages-1
                    )
                    imageName = "image\(lastImageNumber)"
                    
                    if soundIsOn {
                        lastSoundNumber = nonRepeatingRandom(
                            lastNumber: lastSoundNumber,
                            upperBounds: numberOfSounds-1
                        )
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accent)
        }
        .padding()
    }
    
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds)
        } while newNumber == lastNumber
        
        return newNumber
    }
    
    
    func playSound(soundName: String) {
        audioPlayer?.stop()
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("🕸️ Could not read the file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription)")
        }
    }
}


#Preview {
    ContentView()
}
