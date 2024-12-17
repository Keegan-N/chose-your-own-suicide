//
//  hell.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI
struct hell: View {
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("You Burn In Hell For All Of Eternity")
                    .font(.system(size: 100))
                    .bold()
                    .opacity(animation ? 1 : 0)
                NavigationLink {
                    startView()
                } label: {
                    Text("Start Over")
                        .padding(8)
                        .background(.black, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                }
                .opacity(animation ? 1 : 0)
                
            }
                .onAppear(){
                    withAnimation(.linear(duration: 3)) {
                    
                        animation = true
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(.red)
                .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    hell()
}
