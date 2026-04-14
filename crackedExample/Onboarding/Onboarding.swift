//
//  OnBoarding.swift
//  crackedExample
//
//  Created by Syeda Ahmed on 4/13/26.
//

import Foundation
import SwiftUI

struct FirstView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
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
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            //Screen 1
            OnboardingDetail(
                image: "angryChefPoint",
                
                description: "Welcome to Cracked! This is a fast-paced game where you crack eggs and swipe feathers!"
            ).tag(0)
            
            //Screen 2
            OnboardingDetail(image: "angryChefPoint", description: "Click on the egg to crack it").tag(1)
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

#Preview {
    FirstView()
}
