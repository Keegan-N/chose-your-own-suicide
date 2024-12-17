//
//  hell.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI
struct Heaven: View {
    @State var animation: Bool = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("You Chill In Heaven For All Of Eternity")
                    .font(.system(size: 80))
                    .bold()
                    .opacity(animation ? 1 : 0)
                Text("You Win!")
                    .font(.title)
                    .opacity(animation ? 1 : 0)
                    
                NavigationLink {
                    startView()
                } label: {
                    Text("Play Again")
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
            .background(Color(.systemCyan))
            .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    Heaven()
}
