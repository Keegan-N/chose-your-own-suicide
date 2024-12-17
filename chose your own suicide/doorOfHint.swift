//
//  SwiftUIView.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI
import AVFoundation

struct doorOfHint: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State var more: Bool = false
    @Binding var health: Int
    @State var count: Int
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            if (health == 0){
                youDied(how: "blood letting")
            } else {
                VStack{
                    Spacer()
                        
                        .frame(height: 100)
                    Image("statue")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    Text("there is a golden alter with writing insicribed that says\"give blood for advice\" and a knife next to it")
                    Text("what do you do?")
                        .font(.title2)
                        .fontWeight(.black)
                        .padding(5)
                    if(count == health + 1) {
                        Text("Say \"Nuh Uh\" and the world is yours to command")
                    } else if (count > health + 1) {
                        Text("The next hint is the best yet")
                    }
                    HStack(spacing: 40){
                        Button{
                           
                            health -= 1
                            more = true
                            if let url = Bundle.main.url(forResource: "knife", withExtension: "mp3") {
                                do {
                                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                                    audioPlayer?.play()
                                } catch {
                                    print("Error playing sound: \(error.localizedDescription)")
                                }
                            } else {
                                print("Sound file not found")
                            }

                        }label: {
                            Text(more ? "give a little more blood": "give a little blood")
                        }
                        .scaleEffect(animation ? 1.3 : 1)
                        .buttonStyle(.bordered)
                        .foregroundStyle(.black)
                        NavigationLink{
                            returning_customer(health: $health)
                        }label: {
                            Text("leave")
                                
                        }
                        .buttonStyle(.bordered)
                        .foregroundStyle(.black)
                    }
                    Spacer()
                    
                    
                }
                //        .frame(maxWidth: .infinity,maxHeight: .infinity)
                //        .background(.green)
                .onAppear(){
                    withAnimation(.linear(duration: 2).repeatForever()) {
                        
                        animation = true
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

