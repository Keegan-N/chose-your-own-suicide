//
//  doorOfDoom.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct doorOfDoom: View {
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .foregroundStyle(.green)
                    .opacity(0.7)
                    .ignoresSafeArea()
                VStack{
                    Text("as you get in the room the door slams behind you and poison gas fills the room")
                        .font(.system(size: 25))
                    
                    Text("what do you do?")
                        .font(.title2)
                        .fontWeight(.black)
                        .padding()
                    HStack{
                        NavigationLink {
                            youDied(how: "trying to FIGHT toxic gas")
                        } label: {
                            Text("fight the gas")
                        }
                        NavigationLink {
                            purgatory()
                        } label: {
                            Text("hold your breath")
                        }
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.black)
                    Image("Gas")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(animation ? 1 : 0.8)
                }
            }
            .onAppear(){
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                    
                    animation = true
                }
            }
        .navigationBarBackButtonHidden(true)

        
        
        }

    }
}

#Preview {
    doorOfDoom()
}
