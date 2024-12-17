//
//  ContentView.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var health: Int
    @State var didYouJustWake: Bool = true
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                Text(didYouJustWake ? "You Just Wake Up" : "Your still Awake")
                    .font(.largeTitle)
                    .bold()
                Text(didYouJustWake ? "you have no clue where you are or how you got there all you know is that there are 4 doors" : "you still have no clue where you are or how you got there all you know now is that there are 4 doors and the floor is really uncomfortable to lay on")
                    .padding()
                Text("what do you do?")
                    .font(.title2)
                    .fontWeight(.black)
                
                VStack{
                NavigationLink {
                    doorOfDoom()
                } label: {
                    Text("go through door 1")
                }
                
                NavigationLink {
                    doorOfNerdom(health: $health)
                } label: {
                    Text("go through door 2")
                }
                NavigationLink {
                    doorOfGaslighting(health: $health)
                } label: {
                    Text("go through door 3")
                }
                NavigationLink {
                    doorOfHint(health: $health,count: health)
                } label: {
                    Text("go through door 4")
                }
                
                
                Button(action: {
                    didYouJustWake = false
                }, label: {
                    Text(didYouJustWake ? " just lay there         " : " keep laying there ")
                })
                .frame(width: 250)
            }
                
                .buttonStyle(.bordered)
                .foregroundStyle(.black)
                
                Image("Doors")
                   
                    .resizable()
                    .padding(.top)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                   
             
                    
            }
            .padding()
        }
        .onAppear(){
            withAnimation(.linear(duration: 2)) {
            
                animation = true
            }
        }
        .opacity(animation ? 1 : 0)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    startView()
}
