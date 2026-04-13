
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
            //OnboardingDetail(
        }
    }
}

//Reusable view for each step/screen
struct OnboardingDetail: View {
    var image: String
    var title: String
    var description: String
    var body: some View {
        ZStack {
            Image("background")
            VStack {
                //Image()
            }
        }
    }
}
