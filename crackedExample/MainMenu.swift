//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26 amat.

import SwiftUI

struct FeedbackButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

struct CircleButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(Color.customRed)
            .background(Color.customBeige)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.black, lineWidth: 0.8)
            }
            .shadow(radius: 5)
    }
}
struct CapsuleButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
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
    }
}
extension View {
    func circleButtonStyle() -> some View {
        self.modifier(CircleButtonModifier())
    }
    
    func capsuleButtonStyle() -> some View {
        self.modifier(CapsuleButtonModifier())
    }
}

struct  MainMenu: View {
    @State private var startClassicMode = false
    @State private var startZenMode = false
    @State private var openStore = false
    @State private var openSettings = false
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
                                        Image("coin")
                                        Text("36")
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
                        
                        Button(action: {startClassicMode = true} ) {
                            Text("Classic Mode")
                                    .capsuleButtonStyle()
                                
                        }
                        .navigationDestination(isPresented: $startClassicMode) {
                            GameView()
                                .navigationBarBackButtonHidden(true)
                            
                        }
                        
                        
                        Button(action: {startZenMode = true }) {
                            Text("Zen Mode")
                            .capsuleButtonStyle()
                        }
                        
                        .navigationDestination(isPresented: $startZenMode) {
                            GameView()
                        }
                        
                        HStack{
                            Button(action: {}){
                                Image(systemName: "gearshape.fill")
                                    .circleButtonStyle()
                                    .accessibilityLabel("Access settings.")
                                
                            }
                            .navigationDestination(isPresented: $openSettings) {
                                Settings()
                            }
                            
                            Button(action: {openStore = true}){
                                //openStore = true
                                Image(systemName: "storefront.fill")
                                    .circleButtonStyle()
                                    .accessibilityLabel("Access the store.")
                                
                            }
                            .navigationDestination(isPresented: $openStore) {
                                storeScreen()
                            }
                            
                            Button(action: {}){
                                Image(systemName: "crown.fill")
                                    .circleButtonStyle()
                                    .accessibilityLabel("Access the global and daily leaderboards.")
                            }
                            .navigationDestination(isPresented: $startZenMode) {
                                GameView()
                            }
                            
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    .buttonStyle(FeedbackButtonStyle())
                }
            }
        }
    }
}
#Preview (){
    MainMenu()
}
