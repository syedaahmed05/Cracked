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
    @Environment(\.dismiss) var dismiss
    //@State private var backtoView = true
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
                            .offset(x: 120, y: -85)
                        
                        
                        
                        Spacer()
                        
                        Button(action: { dismiss() }){
                            Image(systemName: "xmark.circle.fill")
                                //.circleButtonStyle()
                                .foregroundStyle(Color.customRed)
                                .frame(width: 90, height: 50)
                                .font(Font.system(size: 40))
                                .accessibilityLabel("Close settings.")
                                .offset(x: 0, y: -85)
                                
                        }
                        
                        }
                            .buttonStyle(FeedbackButtonStyle())
                    }
                    
                    
                    
                    Text("Music by Motorcity Era")
                        .font(Font.custom("Boba Milky", size:20))
                        .foregroundStyle(Color.customRed)
                        .offset(x: 0, y: -80)
                    
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
                               .offset(x:-40 ,y:-50)
                        
                        Text("Music")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                            .offset(x:-20,y:-50)
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
                               .offset(x:-60 ,y:-10)
                        
                        Text("Sfx")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                            .offset(x:-30,y:-10)
                    }

                }
            }
        }
        
    }
    


#Preview (){
    Settings()
}
