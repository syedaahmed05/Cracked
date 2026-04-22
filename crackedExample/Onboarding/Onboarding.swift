//
//  OnBoarding.swift
//  crackedExample
//
//  Created by Syeda Ahmed on 4/13/26.
//

import Foundation
import SwiftUI

struct FirstView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true //remembers if user has done onboarding
    
    var body: some View {
        if isFirstLaunch {
            OnboardingView(isFirstLaunch: $isFirstLaunch)
            
        }
        else {
            ContentView()
        }
    }
}

struct TutorialStepView: View {
    //starts above screen
    @State private var phase: TutorialPhase = .eggFalling
    @State private var eggY: CGFloat = -200
    @State private var overlayOpacity: Double = 0
    @State private var showCracked = false
    @State private var yolkY: CGFloat = 0
    @State private var yolkOpacity: Double = 0
    
    //where egg freezes center-ish above pan
    private let eggFreezeY: CGFloat = 0
    private let eggSize: CGFloat = 90
    
    enum TutorialPhase {
        case eggFalling //egg animates down, freezes
        case spotlight //overlay appears, chef speaks
        case eggTapped //cracked egg shows, yolk falls
    }
    
    var body: some View {
        GeometryReader { geo in
            let screenMid = geo.size.width / 2
            let eggFreeze = geo.size.height * 0.35 //egg freezes at 35% down
            let eggRect = CGRect(
                x: screenMid - eggSize / 2,
                y: eggFreeze - eggSize / 2,
                width: eggSize,
                height: eggSize
                )
            
        }
    }
}

struct OnboardingView: View {
    @Binding var isFirstLaunch: Bool
    @State private var currentStep = 0
    
    var body: some View {
        
            //Screen 1
        if (currentStep == 0) {
            OnboardingDetail(
                image: "angryChefPoint",
                
                description: "Welcome to Cracked! This is a fast-paced game where you crack eggs and swipe feathers!")
            .onTapGesture(coordinateSpace: .global) { location in print("Global X: \(location.x), Y: \(location.y)") //printing coordinates to know which x/y coordinates to have objects drop from
                currentStep += 1
            }
        }
            
        else if (currentStep == 1) {
            //Screen 2
            ZStack {
                Image("egg")
                    .resizable()
                    //.overlay()
                OnboardingDetail(image: "angryChefPoint", description: "Click on the egg to crack it")
            }
        }
        
    }
    
}

//Reusable view for each step/screen
struct OnboardingDetail: View {
    var image: String
    //var title: String
    var description: String
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("onboardingBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                
                
                ZStack {
                    
                    Spacer()
                    VStack {
                        Spacer()
                        Image("emptyPan")
                            .resizable()
                            .scaledToFit()
                            .padding(.top)
                        
                        HStack {
                            Image(.angryChefPoint)
                                .resizable()
                            //.scaledToFit()
                                .frame(width: 160, height: 200)
                            
                            
                            Text(description)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                            
                        
                    }
                }
            }
        }
    }
}

struct FallingObject: View {
    var image: String
    var size: CGFloat = 90 //core graphics float. responsible for coordinates, sizes, positions default val 90x90 pt
    @Binding var yOffset: CGFloat //@Binding means the state of yOffset is owned by somebody else
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .offset(y: yOffset) //shift the object relative to the view
    }
}

struct SpotlightOverLay: View {
    var radius: Double //to calculate radius of the circle
    //to find x,y coordinates for where to put the circle
    var xPosition: Double
    var yPosition: Double
    
    private var holeRect: CGRect { //internal math should be private because these are kitchen tasks
        CGRect ( //creates invisible box x,y coordinates is the top left corner
            x: xPosition - radius,
            y: yPosition - radius,
            width: radius * 2,
            height: radius * 2
        )
    }
    
    var body: some View {
        Canvas { context, size in //Canvas is a raw drawing surface! context = paintbrush
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(.black.opacity(0.75))) //fills entire screen with origin and size into a black overlay
            var ctx = context
            ctx.blendMode = .destinationOut //erases the foreground like clipshape? like a hole punch
            ctx.fill(Path(ellipseIn: holeRect), with: .color(.white))
        }//code above creates circle inside holeRect color doesnt matter because destinationOut takes precedence
        .ignoresSafeArea()
    }
    
    
}



#Preview {
    FirstView()
}



