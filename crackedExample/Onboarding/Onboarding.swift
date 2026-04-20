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
    var size: CGFloat = 90 //core graphics float. responsible for coordinates, sizes, positions
    @Binding var yOffset: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .offset(y: yOffset)
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


enum TutorialPhase {
    case eggFalling //egg animates down, freezes
    case spotlight //overlay appears, chef speaks
    case eggTapped //cracked egg shows, yolk falls
}

#Preview {
    FirstView()
}


