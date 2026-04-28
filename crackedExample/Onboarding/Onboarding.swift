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

struct Step1View: View {
    var onComplete: () -> Void
    //starts above screen
    @State private var phase: TutorialPhase = .eggFalling
    @State private var eggY: CGFloat = -200
    @State private var overlayOpacity: Double = 0
    
    
    //Shell animation variables
    @State private var leftShellX: CGFloat = 0
    @State private var rightShellX: CGFloat = 0
    @State private var leftShellY: CGFloat = 0
    @State private var rightShellY: CGFloat = 0
    @State private var shellOpacity: Double = 0 //fades in when egg is tapped
    @State private var intactEggOpacity: Double = 1 //fades out when egg is tapped
    
    //Yolk animation
    @State private var yolkY: CGFloat = 0
    @State private var yolkOpacity: Double = 0
    
    //Pan
    @State private var showFilledPan: Bool = false
    
    private let eggSize: CGFloat = 65
    
    
    
    
    enum TutorialPhase {
        case eggFalling //egg animates down, freezes
        case spotlight //overlay appears, chef speaks
        case eggTapped //cracked egg shows, yolk falls
        case yolkFalling //yolk falls into pan
        case panFilled //show filled pan
    }
    
    var body: some View {
        GeometryReader { geo in
            let screenMid = geo.size.width / 2
            let eggFreeze = geo.size.height * 0.35 //egg freezes at 35% down
            let eggRect = CGRect(
                x: screenMid - eggSize / 2, //center - half width to get left edge
                y: eggFreeze - eggSize / 2, //center - half height = top height
                width: eggSize,
                height: eggSize + 20
            )
            let panY = geo.size.height * 0.75 //where pan sits on screen
            
            ZStack {
                //Add background
                Image("onboardingBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                //Empty pan
                
                
                if !showFilledPan {
                    VStack {
                        Spacer()
                        Image("emptyPan")
                            .resizable()
                            .scaledToFit() //test this
                            .padding(.bottom, 120)
                    }
                }
                //Filled pan when yolk falls into it
                if showFilledPan {
                    VStack {
                        Spacer()
                        Image("fullPan")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 120)
                            .transition(.opacity) //what does transition do???
                    }
                }
                
                //Intact egg (fades out when tapped)
                if phase == .eggFalling || phase == .spotlight {
                    Image("egg")
                        .resizable()
                        .frame(width: eggSize, height: eggSize + 20)
                        .position(x: screenMid, y: eggFreeze + eggY) //dont have egg appear yet
                        .opacity(intactEggOpacity)
                }
                
                //left shell logic
                if phase == .eggTapped || phase == .yolkFalling || phase == .panFilled {
                    Image("leftShell")
                        .resizable()
                        .frame(width: eggSize, height: eggSize)
                        .position(x: screenMid, y: eggFreeze)
                        .offset(x: leftShellX, y: leftShellY)
                        .opacity(shellOpacity)
                }
                
                //right shell logic
                if phase == .eggTapped || phase == .yolkFalling || phase == .panFilled {
                    Image("rightShell")
                        .resizable()
                        .frame(width: eggSize, height: eggSize)
                        .position(x: screenMid, y: eggFreeze) //position shell here
                        .offset(x: rightShellX, y: rightShellY) //shift the egg
                        .opacity(shellOpacity)
                }
                
                //Yolk logic
                if phase == .yolkFalling { //got rid of || phase == .panFilled
                    Image("liquidEgg")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .position(x: screenMid, y: eggFreeze + Double(yolkY))
                        .opacity(yolkOpacity)
                }
                
               
                //Spotlight overlay
                if phase == .spotlight {
                    SpotlightOverLay(radius: Double(eggSize), xPosition: Double(screenMid), yPosition: Double(eggFreeze + eggY))
                        .opacity(overlayOpacity)
                        .ignoresSafeArea()
                        //.allowsHitTesting(phase == .spotlight) //ask about this
                        .onTapGesture {
                            //TODO: Make sure users cant tap outside of circle
                            //code would change state to transiton to step 2; this is supposed to take the taps that arent in the circle
                        }
                }
                
                //invisible egg tap target
                if phase == .spotlight {
                    Circle()
                        .fill(.clear)
                        .frame(width: eggSize + 20, height: eggSize + 20)
                        .position(x: screenMid, y: eggFreeze)
                        .contentShape(Circle())
                        .onTapGesture {
                            handleEggTap (eggFreeze: eggFreeze, panY: panY)
                        }
                }
                
                if phase == .spotlight {
                    VStack {
                        Spacer()
                        HStack(alignment: .bottom) {
                            Image("angryChefPoint")
                                .resizable()
                                .frame(width: 160, height: 200)
                            speechBubble(image: "step1")
                                .frame(maxWidth: .infinity) //take up all the space remaining after the chef
                                .padding(.bottom, 98) //push speech bubble up
                                
                            //TODO: Add sound effect for when chef speaks
                                
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                    }
                    .ignoresSafeArea()
                }
                
            }
            .onAppear {
                startEggDrop(targetY: eggFreeze)
            }
            
        }
    }
    
    func startEggDrop(targetY: CGFloat) {
        eggY = -(targetY + 200) //start above screen
        withAnimation(.easeIn(duration: 0.6)) {
            eggY = 0 //fall to freeze point in 0.6 seconds (starts slow then accelerates)
        }
        
        //after egg lands, show spotlight
        //DispatchQueue manages when/where code runs
        //use .main because to use main thread
        //asyncAfter runs the code after a delay
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            phase = .spotlight
            withAnimation(.easeIn(duration: 0.4)) {
                overlayOpacity = 1
            }
        }
    }
    
    func handleEggTap(eggFreeze: CGFloat, panY: CGFloat) {
        phase = .eggTapped
        
        //fade overlay out, fade intact egg out, fade shells in
        withAnimation(.easeOut(duration: 0.2)) {
            overlayOpacity = 0
            intactEggOpacity = 0
            shellOpacity = 1
        }
        
        //show shells splitting
        withAnimation(.easeOut(duration: 0.35).delay(0.15)) {
            leftShellX = -45
            rightShellX = 45
            leftShellY = -10
            rightShellY = -10
        }
        
        //yolk appears and falls into pan
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            phase = .yolkFalling
            yolkOpacity = 1
            withAnimation(.easeIn(duration: 0.5)) {
                yolkY = panY - eggFreeze //falls from egg position and stops at egg position
                
                
            }
        }
        
        //shell fades out as yolk lands
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.easeOut(duration: 0.3)) {
                shellOpacity = 0
            }
        }
        
        //swap empty pan with filled pan
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            phase = .panFilled
            withAnimation(.easeIn(duration: 0.4)) {
                showFilledPan = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            onComplete() //tells OnBoardingView to advance to step 2
        }
        
        
        
    }
}

struct Step2View {
    var onComplete: () -> Void
    @State private var phase: Step2Phase = .featherFalling
    @State private var featherX: CGFloat = 0
    @State private var featherY: CGFloat = 0
    @State private var featherSwiped: Bool = false
    
    enum Step2Phase {
        case featherFalling //feather drifts like a feather onto screen
        case spotlight //overlay appears, chef speaks, screen freezes
        case featherSwiped
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
            .onTapGesture {
                currentStep += 1
            }
        }
            
        else if (currentStep == 1) {
            //Screen 2
            Step1View(onComplete: {
                currentStep += 1
            })
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
            y: yPosition,
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

struct speechBubble: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            
    }
}





#Preview {
    FirstView()
}



















#Preview {
    FirstView()
}
