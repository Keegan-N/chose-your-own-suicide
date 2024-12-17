import SwiftUI
import AVFoundation

struct startView: View {
    @State private var health: Int = 3
    @State private var scale: Bool = false

    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Death Sim")
                    .frame(height: 125)
                    .font(.system(size: 80))
                Text("How much health do you want to have?")
                    .font(.title3)
                    .bold()
                
                TextField("3", value: $health, format: .number)
                    .frame(width: 35)
                    .font(.title)
                    .onChange(of: health) { oldValue, newValue in
                        if (health  < 1) {
                            health = 1
                        }
                        if (health  > 99) {
                            health = 99
                        }
                    }
                Spacer().frame(height: 50)
                
                NavigationLink {
                    ContentView(health: $health)
                } label: {
                    Text("Start")
                        .font(.system(size: 40))
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.black)
                .scaleEffect(scale ? 1.5 : 1)
                
                .onAppear(){
                    withAnimation(.linear(duration: 2).repeatForever()) {
                        
                        scale = true
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarBackButtonHidden(true)
            }
            
        
        }
    
}

#Preview {
    startView()
}
