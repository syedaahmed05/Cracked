//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26 amat.

import SwiftUI



struct  MainMenu: View {
    @State private var startClassicMode = false
    @State private var startZenMode = false
    @State private var openStore = false
//new comment
    
    var body: some View {
        GeometryReader  { geo in
            NavigationStack{
                ZStack {
                    Image("mainMenuBackground")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width:geo.size.width, height:geo.size.height,alignment: .center)
                    VStack{
                        HStack{
                                Button(action:{}) {
                                    HStack {
                                        Image("coin") // Asset
                                        Text("36")              // Text
                                    }
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .font(Font.custom("Super Meatball", size: 30))
                                .foregroundStyle(Color.customRed)
                                .background{
                                    Capsule()
                                        .fill(Color.customBeige)
                                        .overlay{
                                            Capsule()
                                                .inset(by: 10)
                                                .fill(Color.customLightBeige)
                                        }
                                }
                                .overlay {
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 0.8)
                                }
                                .shadow(radius: 5)
                           
                            Button(action:{} ) {
                                ZStack{
                                    Text("15")
                                }
                            }
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("Super Meatball", size: 30))
                            //.background(Color.customBeige)
                            //.shadow(radius: 2)
                            .foregroundStyle(Color.customRed)
                            .background{
                                Capsule()
                                    .fill(Color.customBeige)
                                    .overlay{
                                        Capsule()
                                            .inset(by: 10)
                                            .fill(Color.customLightBeige)
                                    }
                            }
                            .overlay {
                                Capsule()
                                    .stroke(Color.black, lineWidth: 0.8)
                            }
                            .shadow(radius: 5)
                            
                            

                        }.frame(maxWidth: .infinity)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button("Classic Mode") {
                            startClassicMode = true
                        }
                        .padding(30)
                        .frame(minWidth: 250)
                        .font(Font.custom("Super Meatball", size: 30))
                        .background(Color.customBeige)
                        .shadow(radius: 2)
                        .foregroundStyle(Color.customRed)
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
                        .frame(minWidth: 250)
                        .font(Font.custom("Super Meatball", size: 30))
                        .background(Color.customBeige)
                        .shadow(radius: 2)
                        .foregroundStyle(Color.customRed)
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
                            .foregroundStyle(Color.customRed)
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
                                //openStore = true
                                Image(systemName: "storefront.fill")
                                    .accessibilityLabel("Access the store.")
                                
                            }
                            .padding()
                            .background(Color.customBeige)
                            .shadow(radius: 5)
                            .foregroundStyle(Color.customRed)
                            .clipShape(Circle())
                            .overlay{
                                Circle()
                                    .stroke(Color.black, lineWidth: 0.8)
                            }
                            .shadow(radius: 5)
                            .navigationDestination(isPresented: $openStore) {
                                storeScreen()
                            }
                            Button(action: {}){
                                Image(systemName: "crown.fill")
                                    .accessibilityLabel("Access the global and daily leaderboards.")
                            }
                            .padding()
                            .background(Color.customBeige)
                            .shadow(radius: 5)
                            .foregroundStyle(Color.customRed)
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
