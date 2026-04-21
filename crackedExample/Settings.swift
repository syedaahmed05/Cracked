//
//  Settings.swift
//  crackedExample
//
//  Created by Angela on 2/4/26.
//

import Foundation
import UIKit
import SwiftUI
import AVFAudio
import AVFoundation
struct Settings: View {
    @State private var isSoundOn = true
    @State private var isSFXOn = true
    
    @State private var backtoView = true
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("settingsBgShape")
                    .resizable()
                    //.edgesIgnoringSafeArea(.all)
                    .scaledToFit()
                    .frame(width:geo.size.width, height:geo.size.height,alignment: .center)
                VStack {
                    HStack {
                        
                        Text("Settings")
                            .font(Font.custom("Super Meatball", size: 40))
                            .foregroundStyle(Color.customRed)
                            .frame(alignment: .center)
                        
                        Spacer()
                        
                        Button(action: {}){
                            Image(systemName: "xmark.circle.fill")
                                //.circleButtonStyle()
                                .foregroundStyle(Color.customRed)
                                .frame(width: 90, height: 50)
                                .font(Font.system(size: 40))
                                .accessibilityLabel("Close settings.")
                            
                        }
                        .navigationDestination(isPresented: $backtoView) {
                            MainMenu()
                        }
                            .buttonStyle(FeedbackButtonStyle())
                    }
                    
                    
                    
                    Text("Music by Motorcity Era")
                        .font(Font.custom("Boba Milky", size:20))
                        .foregroundStyle(Color.customRed)
                    
                    HStack {
                        Button(action: {withAnimation {isSoundOn.toggle()
                                       // add my logic ere later
                                   }
                               }) {
                                   Image(systemName: isSoundOn ? "speaker.wave.2.fill" : "speaker.slash.fill")
                                       .font(.largeTitle)
                                       .foregroundColor(isSoundOn ? .customOrange : .gray)
                               }
                               .contentTransition(.symbolEffect(.replace))
                        
                        Text("Music")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                    }
                    HStack {
                        Button(action: {withAnimation {isSFXOn.toggle()
                                       // add my logic ere later
                                   }
                               }) {
                                   Image(systemName: isSFXOn ? "music.note" : "music.note.slash")
                                       .font(.largeTitle)
                                       .foregroundColor(isSFXOn ? .customOrange : .gray)
                               }
                               .contentTransition(.symbolEffect(.replace))
                        
                        Text("Sfx")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                    }

                }
            }
        }
        
    }
    
    
    
    
    
    
}

#Preview (){
    Settings()
}
