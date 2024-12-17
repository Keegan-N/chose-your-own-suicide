//
//  purgatory.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct purgatory: View {
    @State var time: Int = 0
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                Text("suddenly all the gas sinks through the floor and a button descends from the ceiling that has the label \"press to continue the gas\"")
                     
                     
                    .padding()
                    .font(.title2)
       
                
                Text("you look around for the door and find it is gone")
                    .bold()
                    .padding(.vertical)
                Text("what do you do?")
                    .font(.title2)
                    .bold()
                if (time > 0){
                    Text("you have been here \(time) minutes")
                }
                
                HStack(spacing: 50){
                    Button {
                        time += 5
                    } label: {
                     Text("wait")
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.black)
                    NavigationLink{
                        youDied(how: "self inflicted posion gas")
                    } label: {
                        Text("press the button")
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.black)
                    .scaleEffect(animation ? 1 : 1.5)
                }
                
                
            }
            .onAppear(){
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                    
                    animation = true
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.gray)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    purgatory()
}
