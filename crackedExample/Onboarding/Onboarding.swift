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
            OnboardingDetail(image: "angryChefPoint", description: "Click on the egg to crack it")
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
                    
                    
                    VStack {
                        Spacer()
                        
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

struct fallingObject {
    @State var yPosition: Double
    var image: String
}

#Preview {
    FirstView()
}

