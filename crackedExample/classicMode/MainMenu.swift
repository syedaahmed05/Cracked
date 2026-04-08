//
//  MainMenu.swift
//  crackedExample
//
//  Created by Angela on 2/4/26 amat.


import SwiftUI



struct  MainMenu: View {
    @State private var startClassicMode = false
    @State private var startZenMode = false

    
    var body: some View {
        NavigationStack{
            VStack{
                Button("Classic Mode") {
                    startClassicMode = true
                }
                .padding()
                .font(Font.custom("Super Meatball", size: 20))
                .background(Color.customBeige)
                .shadow(radius: 5)
                .border(Color(.black), width: 0.8)
                .foregroundStyle(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                .navigationDestination(isPresented: $startClassicMode) {
                    GameView()
                }
                
                Button("Zen Mode") {
                    startZenMode = true
                }
                .padding()
                .font(Font.custom("Super Meatball", size: 20))
                .background(Color.customBeige)
                .shadow(radius: 5)
                .border(Color(.black), width: 0.8)
                .foregroundStyle(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                .navigationDestination(isPresented: $startZenMode) {
                    GameView()
                }
                
//                HStack{
//                    Button(){
//
//                    }
//                    .padding()
//                    .background(Color.customBeige)
//                    .shadow(radius: 5)
//                    .border(Color(.black), width: 0.8)
//                    .foregroundStyle(Color.black)
//                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                    .shadow(radius: 5)
//                    .navigationDestination(isPresented: $startZenMode) {
//                        GameView()
//                    }
//
//
//                }
            }
        }
    }
}
#Preview (){
    MainMenu()
}





