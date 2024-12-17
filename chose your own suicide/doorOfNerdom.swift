//
//  doorOfNerdom.swift
//  chose your own suicide
//
//  Created by Norgard, Keegan - Student on 9/20/24.
//

import SwiftUI

struct doorOfNerdom: View {
    @Binding var health: Int
    var titles:[String] = ["The Science of Everyday Life", "Unlocking Nature's Secrets", "History's Hidden Figures", "The Art of Mindful Living", "The Language of the Cosmos", "Cultivating Curiosity: A Guide to Lifelong Learning", "Tech Tides: Navigating the Digital Future", "Beyond the Stars: An Introduction to Astronomy", "The Evolution of Ideas: How Thought Shapes Society", "Whispers of the Forest: Understanding Ecosystems", "The Fabric of Time: A Journey Through History", "The Psychology of Color: Impact on Emotion and Behavior", "Incredible Inventions That Changed the World", "The Blueprint of Life: Genetics Simplified", "Voices from the Past: Oral Histories Revisited", "Mind Over Matter: The Power of Positive Thinking", "The World Beneath Our Feet: Soil Science Explained", "Culinary Cultures: A Global Journey Through Food", "The Future of Work: Trends Shaping Careers", "Navigating World Religions: Beliefs and Practices", "Sustainable Living: Eco-Friendly Choices for Everyday Life", "The Human Body: A Comprehensive Guide", "Chasing Shadows: The Science of Light and Darkness", "The Art of Negotiation: Strategies for Success", "The Wonders of Water: Hydrology and Its Importance", "Fables of Innovation: Lessons from Great Thinkers", "Mindful Movement: The Benefits of Yoga and Exercise", "The Mystery of Microbes: Life Under the Microscope", "The Geometry of Nature: Patterns in the Wild", "The World of Whales: Marine Mammals Explored","Whispers of the Soul: A Journey to Inner Enlightenment", "The Secrets of Sleep: Understanding Rest and Recovery", "The Digital Divide: Bridging Technology Gaps", "From Seeds to Sustainability: Gardening for the Future", "The Mechanics of Music: Understanding Sound and Rhythm", "Cultures in Transition: Globalization and Identity", "The Universe in a Nutshell: Physics for Everyone", "A Tapestry of Traditions: Celebrations Around the World", "The Mind-Body Connection: Wellness and Holistic Health", "The Influence of Media: How News Shapes Perception", "The Journey of Water: From Source to Sea", "Building Resilience: Strategies for Tough Times", "The Mysteries of the Brain: Neuroscience Made Simple", "Climate Change 101: Understanding the Crisis", "The Quest for Knowledge: A Guide to Research Skills", "Cultural Heritage: Preserving the Past for the Future", "Exploring Animal Behavior: Insights from the Wild", "The Evolution of Language: From Grunts to Grammar", "The Science of Happiness: What Makes Us Thrive", "Navigating Financial Literacy: A Guide for Beginners"]
    @State var animation: Bool = false
    @State var scale: Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                Text("You go through the door and find a libray with 50 books")
                NavigationLink{
                    returning_customer(health: $health)
                }label: {
                    Text("Return to Room Before")
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.black)
                List {
                    ForEach(0..<50, id: \.self) { item in
                        NavigationLink{
                            if item == 30 {
                                VStack{
                                    Text("As you pull the book from the shelf a new door opens to your left")
                                    HStack{
                                        NavigationLink{
                                            secret_room(health: $health)
                                        } label: {
                                            
                                            Text("Go Through the door")
                                                .padding(5)
                                                .background(.black, in: RoundedRectangle(cornerRadius: 5))
                                                .foregroundStyle(.white)
                                                .scaleEffect(scale ? 1.2 : 1)
                                                .animation(.linear(duration: 2).repeatForever(), value: scale)
                                                .onAppear(){
                                                    
                                                    scale = true
                                                    
                                                }
                                                .offset(x: -10)
                                        }
                                        NavigationLink{
                                            doorOfNerdom(health: $health)
                                        } label: {
                                            Text("Leave")
                                                .padding(5)
                                                .background(.black, in: RoundedRectangle(cornerRadius: 5))
                                                .foregroundStyle(.white)
                                                .scaleEffect(scale ? 1.2 : 1)
                                                .animation(.linear(duration: 2).repeatForever(), value: scale)
                                                .onAppear(){
                                                    
                                                    scale = true
                                                    
                                                }
                                                .offset(x: 10)

                                        }
                                    }

                                }
                                .navigationBarBackButtonHidden(true)
                            }
                            if (item != 30){
                                Text("Nothing here but blank pages")
                                    .scaleEffect(scale ? 1.2 : 1)
                                    .animation(.linear(duration: 2).repeatForever(), value: scale)
                                    .onAppear(){
                                        
                                            scale = true
                                        
                                    }
                                    
                            }
                            
                            
                        } label: {
                            Text("\(titles[item])")
                        }
                    }
                }
                .offset(y: animation ? 0 : 800)
            }
            .onAppear(){
                withAnimation(.linear(duration: 3)) {
                    
                    animation = true
                }
                
            }
            .background(Color(.systemGray6))
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    startView()
}
