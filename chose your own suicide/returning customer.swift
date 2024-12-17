//
//  ContentView.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct returning_customer: View {
    @Binding var health: Int
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                Text("Your Back Where You Started")
                    .font(.largeTitle)
                    .bold()
                Text("There are still 4 doors ")
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



