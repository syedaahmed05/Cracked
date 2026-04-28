//
//  Settings.swift
//  crackedExample
//
//  Created by Angela on 2/4/26.
//

import SwiftUI
import UIKit
import AVFAudio
import AVFoundation

struct Settings: View {
    //@State private var isSoundOn = true
    @AppStorage("isSoundOn") private var isSoundOn = true
    @AppStorage("isSFXOn") private var isSFXOn = true
    //@State private var isSFXOn = true
    
    @Binding var openSettings: Bool

    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment: .topTrailing) {
            
                Image("settingsBgShape")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.8,
                           height: geo.size.height * 0.4)

                VStack(spacing: 20) {
                    
                    Text("settings")
                        .font(Font.custom("Super Meatball", size: 35))
                        .foregroundStyle(Color.customRed)
                        .padding(.top, 20)

                    Text("Music by Motorcity Era")
                        .font(Font.custom("Boba Milky", size: 20))
                        .foregroundStyle(Color.customRed)

                    HStack(spacing: 25) {
                        Button(action: {
                            withAnimation {
                                isSoundOn.toggle()
                                if isSoundOn {
                                            MenuMusic.shared.playMusic()
                                        } else {
                                            MenuMusic.shared.stopMusic()
                                        }
                            }
                        }) {
                            Image(systemName: isSoundOn
                                  ? "speaker.wave.2.fill"
                                  : "speaker.slash.fill")
                                .font(.largeTitle)
                                .foregroundColor(isSoundOn ? .customOrange : .gray)
                        }

                        Text("music")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                    }

                    HStack (spacing: 50){
                        Button(action: {
                            withAnimation {
                                isSFXOn.toggle()
                                if isSFXOn {
                                            MenuMusic.shared.playSFX()
                                        } else {
                                            MenuMusic.shared.stopSFX()
                                        }
                            }
                        }) {
                            Image(systemName: isSFXOn
                                  ? "music.note"
                                  : "music.note.slash")
                                .font(.largeTitle)
                                .foregroundColor(isSFXOn ? .customOrange : .gray)
                        }

                        Text("sfx")
                            .font(Font.custom("Super Meatball", size: 30))
                            .foregroundStyle(Color.customRed)
                        
                        
                    }

                    Spacer()
                }
                .frame(width: geo.size.width * 0.8,
                       height: geo.size.height * 0.4)

                Button(action: {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
                        openSettings = false
                        MenuMusic.shared.playSFX()
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 35))
                        .foregroundStyle(Color.customRed)
                        .padding(3)
                }
                .contentShape(Rectangle())
                .padding(.trailing, 20)
                .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

    


#Preview (){
    MainMenu()
}
