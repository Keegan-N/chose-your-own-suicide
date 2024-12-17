//
//  doorOfGaslighting.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct doorOfGaslighting: View {
    @Binding var health: Int
    @State var textField: Bool = false
    @State var input: String = ""
    @State var error: Bool = false
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("When You Walk into this room you find a large table with an old computer sitting on the table")
                    .padding()
                Image("Comp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(textField ? "what do you input?" : "what do you do?")
                    .font(.title2)
                    .fontWeight(.black)
                if (error){
                    Text("invalid input")
                        .foregroundStyle(.red)
                        .offset(y: 20)
                }
                if (textField){
                    TextField("What do you input?", text: $input)
                        .padding(.horizontal, 5)
                        .background(.black, in: RoundedRectangle(cornerRadius: 5))
                        .foregroundStyle(.green)
                        .padding()
                        .onSubmit {
                            error = true
                        }
                       
                }
                HStack{
                    Button {
                        textField = true
                    } label: {
                        Text("input something into the computer")
                    }
                    NavigationLink {
                        returning_customer(health: $health)
                    } label: {
                        Text("leave")
                    }
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.black)
                Spacer()
            }
            .opacity(animation ? 1 : 0)
            .onAppear(){
                withAnimation(.linear(duration: 2)) {
                    
                    animation = true
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color(.systemGray4))
            .navigationBarBackButtonHidden(true)
        }
    }
}


