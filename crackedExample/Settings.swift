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
    @Binding var openSettings: Bool

    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topTrailing){
                Image("settingsBgShape")
                    .resizable()
                    .scaledToFit()
                    .frame(width:geo.size.width * 0.8, height:geo.size.height * 0.4,alignment: .center)
                VStack {
                    HStack {
                        
                        Text("settings")
                            .font(Font.custom("Super Meatball", size: 35))
                            .foregroundStyle(Color.customRed)
                            .frame(alignment: .center)
                            .offset(x: 80, y: -115)
                        
                        
                        
                        Spacer()
                        
                        
                        
                        }
                            
                    }
                    .frame(width: geo.size.width * 0.8,height: geo.size.height * 0.4)
                    
                Button(action: {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
                        openSettings = false
                    }
                }){
                    Image(systemName: "xmark.circle.fill")
                        //.circleButtonStyle()
                        .foregroundStyle(Color.customRed)
                        .frame(width: 90, height: 50)
                        .font(Font.system(size: 35))
                        .accessibilityLabel("Close settings.")
                        
                }
                .buttonStyle(FeedbackButtonStyle())
                
                    Text("Music by Motorcity Era")
                        .font(Font.custom("Boba Milky", size:20))
                        .foregroundStyle(Color.customRed)
                        .offset(x: -50, y:80)
                    
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
                               .offset(x:-40 ,y:-20)
                        
                        Text("music")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                            //.offset(x:20,y:100)
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
                               .offset(x:-60 ,y:30)
                        
                        Text("sfx")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                            .offset(x:-30,y:30)
                    }

                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
    }
    


#Preview (){
    MainMenu()
}
