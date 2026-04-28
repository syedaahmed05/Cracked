//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26 amat.

import SwiftUI

struct UIFeedback: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: configuration.isPressed)
            .onChange(of: configuration.isPressed) {
                if configuration.isPressed {
                    MenuMusic.shared.playSFX()
                }
            }
    }
}

struct CircleButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.system(size: 28))
            .frame(width: 70, height: 70)
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
    @State private var openLeaderboard = false
    @State private var isStatusBarHidden = true
    
    
    var body: some View {
        GeometryReader  { geo in
            NavigationStack{
                ZStack {
                    if startClassicMode {
                        GameView(mode: .classic)
                            .id(UUID()) // Ensures GameView resets when restarted to prevent state issues
                            .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("exitToMainMenu"))) { _ in
                                startClassicMode = false // Listens for an exit notification to return to the main menu
                            }
                    } else if startZenMode {
                        GameView(mode: .zen)
                            .id(UUID()) //  Ensures GameView resets when restarted to prevent state issues
                            .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("exitToMainMenu"))) { _ in
                                startZenMode = false // Listens for an exit notification to return to the main menu
                            }
                    }else{
                        Image("mainMenuBackground")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .scaledToFill()
                            .frame(width:geo.size.width, height:geo.size.height,alignment: .center)
                        VStack{
                            HStack{
                                Button(action:{}) {
                                    HStack {
                                        Spacer()
                                        Image("coin")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:35)
                                        Spacer()
                                        //Spacer()
                                        Text("36")
                                        Spacer()
                                    }
                                    .frame(height:39)
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
                            
                            Spacer().frame(height: geo.size.height * 0.5)
                            
                            Button(action: {startClassicMode = true} ) {
                                Text("classic mode")
                                    .capsuleButtonStyle()
                                
                            }
                            .navigationDestination(isPresented: $startClassicMode) {
                                GameView(mode: .classic)
                                    .navigationBarBackButtonHidden(true)
                                
                            }
                            
                            Spacer().frame(height: geo.size.height * 0.05)
                            Button(action: {startZenMode = true }) {
                                Text("zen mode")
                                    .capsuleButtonStyle()
                            }
                            
                            .navigationDestination(isPresented: $startZenMode) {
                                GameView(mode: .zen)
                            }
                            Spacer().frame(height: geo.size.height * 0.02)
                            HStack{
                                Button(action: {withAnimation {
                                    openSettings = true
                                }} ){
                                    Image(systemName: "gearshape.fill")
                                        .circleButtonStyle()
                                        .accessibilityLabel("Access settings.")
                                    
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
                                .navigationDestination(isPresented: $openLeaderboard) {
                                   // put leaderbord file here
                                }
                                
                            }
                            
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onAppear {
                            MenuMusic.shared.playMusic()
                        }
                        //                    .frame(
                        //                                width: geo.size.width * 0.8,
                        //                                height: geo.size.height * 0.4
                        //                            )
                        //.fixedSize(horizontal: true, vertical: false)
                        .buttonStyle(UIFeedback())
                        
                        if openSettings {
                            Color.black.opacity(0.5)
                                .zIndex(0)
                                .ignoresSafeArea()
                                .transition(.opacity)
                                .onTapGesture {
                                    withAnimation {
                                        openSettings = false
                                    }
                                }
                            
                            Settings(openSettings: $openSettings)
                                .scaleEffect(openSettings ? 1 : 0.5)
                                .opacity(openSettings ? 1 : 0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: openSettings)
                                .zIndex(1)
                        }
                    }
                       
                       
                    
                }

            }// end of nav stack
            .statusBarHidden(isStatusBarHidden)
        }// end of geo reader
    }// end of body view
}// end of main menu view
#Preview (){
    MainMenu()
        .environmentObject(GameScene())
}
