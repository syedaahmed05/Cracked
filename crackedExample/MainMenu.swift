//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26 amat.

import SwiftUI



struct  MainMenu: View {
    @State private var startClassicMode = false
    @State private var startZenMode = false
//new comment
    
    var body: some View {
        GeometryReader  { geo in
            NavigationStack{
                ZStack {
                    Image("background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width:geo.size.width, height:geo.size.height,alignment: .center)
                    //insert background here
                    VStack{
                        Spacer()
                        Button("Classic Mode") {
                            startClassicMode = true
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity)
                        .font(Font.custom("Super Meatball", size: 20))
                        .background(Color.customBeige)
                        .shadow(radius: 5)
                        .foregroundStyle(Color.black)
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.8)
                        }
                        .shadow(radius: 5)
                        .navigationDestination(isPresented: $startClassicMode) {
                            GameView()
                                .navigationBarBackButtonHidden(true)
                            
                        }
                        
                        
                        Button("Zen Mode") {
                            startZenMode = true
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity)
                        .font(Font.custom("Super Meatball", size: 20))
                        .background(Color.customBeige)
                        .shadow(radius: 5)
                        .foregroundStyle(Color.black)
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.8)
                        }
                        .shadow(radius: 5)
                        .navigationDestination(isPresented: $startZenMode) {
                            GameView()
                        }
                        
                        HStack{
                            Button(action: {}){
                                Image(systemName: "gearshape.fill")
                                    .accessibilityLabel("Access settings.")
                            }
                            .padding()
                            
                            .background(Color.customBeige)
                            .shadow(radius: 5)
                            .foregroundStyle(Color.black)
                            .clipShape(Circle())
                            .overlay{
                                Circle()
                                    .stroke(Color.black, lineWidth: 0.8)
                            }
                            .shadow(radius: 5)
                            .navigationDestination(isPresented: $startZenMode) {
                                GameView()
                            }
                            Button(action: {}){
                                Image(systemName: "storefront.fill")
                                    .accessibilityLabel("Access the store.")
                            }
                            .padding()
                            .background(Color.customBeige)
                            .shadow(radius: 5)
                            .foregroundStyle(Color.black)
                            .clipShape(Circle())
                            .overlay{
                                Circle()
                                    .stroke(Color.black, lineWidth: 0.8)
                            }
                            .shadow(radius: 5)
                            .navigationDestination(isPresented: $startZenMode) {
                                GameView()
                            }
                            Button(action: {}){
                                Image(systemName: "crown.fill")
                                    .accessibilityLabel("Access the global and daily leaderboards.")
                            }
                            .padding()
                            .background(Color.customBeige)
                            .shadow(radius: 5)
                            .foregroundStyle(Color.black)
                            .clipShape(Circle())
                            .fixedSize()
                            .overlay{
                                Circle()
                                    .stroke(Color.black, lineWidth: 0.8)
                            }
                            .shadow(radius: 5)
                            .navigationDestination(isPresented: $startZenMode) {
                                GameView()
                            }
                            
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                }
            }
        }
    }
}
#Preview (){
    MainMenu()
}
