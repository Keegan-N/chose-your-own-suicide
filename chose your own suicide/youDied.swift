//
//  youFuckingDied.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct youDied: View {
    @State var nuhUh: Bool = false
    @State var heaven: Bool = false
    @State var oneTryUsed: Bool = false
    @State var trick: String = "God Is Disapointed"
    @State var animation: Bool = false
    @State var NUHUH: Bool = false
    var how: String
    var body: some View {
        NavigationStack{
            if(oneTryUsed){
                Text("Wrong, Start Over")
                startView()
            } else {
                VStack{
                    if(!animation){
                        Spacer()
                            .frame(height: 50)
                    }
                    Image("dumass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        
                    Text("You Died")
                        .font(.system(size: 80))
                        .bold()
                        .offset(x: animation ? 0 : -400)

                    if(nuhUh){
                        Text("Your Still dead")
                            .font(.system(size: 80))
                            .frame(height: 200)
                            .bold()
                            .offset(x: animation ? -400 : 0)
                            .offset(y: animation ? 0 : -200)
                            
                    }
                    Text("from \(how)")
                        .font(.title2)
                        .bold()
                        .offset(y: animation ? 0 : -200)
                    if(!nuhUh){
                        Text(trick)
                            .offset(y: animation ? 0 : -200)
                    }else {
                        TextField("just say no", text: $trick)
                            .frame(width: 200)
                            .offset(x: 25)
                            .offset(y: animation ? 0 : -200)
                            .onChange(of: trick, { oldValue, newValue in
                                NUHUH = true
                            })
                            .onSubmit {
                                if (trick == "no"||trick == "NO"||trick == "No"){
                                    heaven = true
                                } else {
                                    oneTryUsed = true
                                    trick = ""
                                }
                            }
                    }
                    if(NUHUH){
                        Text("just say no")
                            .offset(y: animation ? 0 : -200)
                    }
                    
                    HStack{
                        NavigationLink {
                            if(heaven){
                                Heaven()
                            } else {
                                hell()
                            }
                        } label: {
                            Text(heaven ?"accept your fate and go to heaven": "accept your fate and go to hell")
                        }
                        .buttonStyle(.bordered)
                        .foregroundStyle(.black)
                        
                        if !nuhUh{
                            Button(action: {
                                nuhUh = true
                                withAnimation(.linear(duration: 1)) {
                                    animation = false
                                }
                            }, label: {
                                Text("nuh uh")
                            })
                            .buttonStyle(.bordered)
                            .foregroundStyle(.black)
                            
                        }
                    }
                    .offset(y: animation ? 0 : -200)
                    Spacer()
                }
                
                
            }
    
        }
        .onAppear(){
            withAnimation(.linear(duration: 1)) {
                
                animation = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    startView()
}
