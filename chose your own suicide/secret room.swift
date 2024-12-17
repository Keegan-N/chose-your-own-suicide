//
//  secret room.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/24/24.
//

import SwiftUI

struct secret_room: View {
    @Binding var health: Int
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Text("If god is disappointed in you sometimes you have to change what he says forceably")
                    .padding()
                HStack{
                    NavigationLink{
                        doorOfNerdom(health: $health)
                    } label: {
                        Text("I Understand")
                            .padding(5)
                            .background(.black, in: RoundedRectangle(cornerRadius: 5))
                            .foregroundStyle(.white)
                    }
                    NavigationLink{
                        secret_room(health: $health)
                    } label: {
                        Text("I Don't Understand")
                            .padding(5)
                            .background(.black, in: RoundedRectangle(cornerRadius: 5))
                            .foregroundStyle(.white)
                    }
                }
            }
            .opacity(animation ? 1 : 0)
            .onAppear(){
                withAnimation(.linear(duration: 2)) {
                    
                    animation = true
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


