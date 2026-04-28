//
//  storeScreen.swift
//  crackedExample
//
//  Created by Manar Hizam on 4/7/26.
//

import SwiftUI

struct storeScreen: View {
    @State private var selectedItem: StoreItem? = nil
    @State private var showingPopUp = false
    @State private var showingComingSoon = false
    
    let chickenItems = [
        StoreItem(name: "CowBoy Chicken", assetName: "cowboyChicken", description:" A chicken with a cowboy style", powerText:" Get immersed into the world of cowboys" , unlockText: "XP must reach: 10", price: 100, category: "Chicken"),
        
        StoreItem(name: "Punk Chicken", assetName: "punkChicken", description:" A chicken with a emo style", powerText:" Get into the rock and roll edgy feel " , unlockText: "XP must reach: 30", price: 120, category: "Chicken"),
        
        StoreItem(name: "Princess Chicken", assetName: "cowboyChicken", description:" A chicken with a cute and pretty princess vibe", powerText:" Immerses you into a girly and pink world" , unlockText: "XP must reach: 10", price: 130, category: "Chicken"),
        
        
    ]
    
    let eggItems = [
        StoreItem(name: "Robot Egg", assetName: "robotEgg", description:" An Egg that has a techy feel", powerText:" Dive into that techy world" , unlockText: "XP must reach: 30", price: 50, category: "Egg"),
        
        StoreItem(name: "Dragen Egg", assetName: "dragenEgg", description:" An egg that has magical and medievil essence", powerText:" Get immersed into that firey and medieval world" , unlockText: "XP must reach: 40", price: 60, category: "Egg"),
        
        StoreItem(name: "Rocket Egg", assetName: "rocketEgg", description:" A rocket egg that makes you feel like your in space", powerText:" Get immersed into the wide galaxy universe of stars" , unlockText: "XP must reach: 40", price: 70, category: "Egg"),
        
        StoreItem(name: "Bat egg", assetName: "batEgg", description:" A spooky egg that for a spooky feel", powerText:" Get immersed into that spooky and supernatural world" , unlockText: "XP must reach: 10", price: 80, category: "Egg"),
        
        StoreItem(name: "Tumble weed", assetName: "tumbleWeed", description: "A dry climate cowboy themed egg for those hor days", powerText:" Get immersed in that wild west vibe ", unlockText:" XP much reach: 60", price: 90, category: "Egg"),
        
    ]
    
    let chefItems = [
        
        StoreItem(name: "Chef1", assetName: "egg", description:" A chicken with a cowboy style", powerText:" Looks cool in the coop" , unlockText: "XP must reach: 10", price: 110, category: "Egg"),
        
        StoreItem(name: "Chef2", assetName: "egg", description:" A chicken with a cowboy style", powerText:" Gets immersive with the edgy feel" , unlockText: "XP must reach: 10", price: 120, category: "Egg"),
        
        StoreItem(name: "Chef3", assetName: "egg", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 140, category: "Egg")
        //i will add the chefs when we have them
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("storeBackground")
                .resizable()
                .ignoresSafeArea()
            // Spacer()
            
            VStack(spacing: 0){
                ZStack{
                    HStack{
                        Image("coinBox")
                        // .resizeable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x:20, y:-1)
                        Spacer()
                        
                        Image("xpRectangle")
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x:-40, y: -1)
                    }
                    .padding(.horizontal,20)
                    
                    Text("SHOP")
                        .font(.custom("Super Meatball", size: 52))
                        .foregroundStyle(.customBeige)
                        .offset(x:-4, y: -40)
                    
                }
                .padding(.top, 20)
                .padding(.bottom,10)
                
                
                VStack(spacing: 0) {
                    
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing:0){
                            Image("ChickenPlank")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height:120)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(chickenItems) { item in
                                        nestTile(item: item){
                                            selectedItem = item
                                            showingPopUp = true
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            Image("eggsWoodenPlank")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height:170)
                            //   Spacer()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(eggItems) { item in
                                        nestTile(item: item){
                                            selectedItem = item
                                            showingPopUp = true
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        
                        .offset(y:-12)
                        
                        Image("chefPlank")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(chefItems) { item in
                                    nestTile(item: item){
                                        selectedItem = item
                                        showingPopUp = true
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .offset(y:-12)
                        
                    }
                    .padding(.bottom,110)
                }
                
                
                
            }
            
            HStack(spacing: 0){
                Button(action :{
                    print("button tapped!")
                }) {
                    Image("skinsButton")
                    
                        .scaledToFit( )
                        .frame(width :190, height:70)
                    //the skins is what the user is seeing in the main store
                }
                
                Button(action: {
                    showingComingSoon = true
                })
                {
                    Image("powerupButton")
                        .scaledToFit()
                        .frame(width: 190, height:70)
                    
                    
                }
            
            }
            
            .frame(maxWidth:.infinity)
            .offset(y:48)
            
            
            if showingComingSoon{
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showingComingSoon = false
                    }
                ZStack{
                    Image("popUp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320, height: 430)

                        
                    
                    VStack(spacing: 12) {
                        Text("Coming Soon!")
                            .font(.custom("Boba Milky", size: 24))
                            .foregroundColor(.customBrown)
                        
                        Text("We are working on this feature, stay tuned!")
                            .font(.custom("Boba Milky", size: 18))
                            .foregroundColor(.customBrown)
                            .multilineTextAlignment(.center)
                        
                        Button(action:{
                            showingComingSoon = false
                        }) {
                            ZStack{
                                Image("buyButton")
                                    .resizable()
                                    .frame(width: 100, height: 30)
                                    .offset(x:30,y:4)
                            }
                            Text("Okay")
                                .font(Font.custom("Boba Milky", size: 20))
                                .foregroundColor(.customBrown)
                                .offset(x:-50, y:5)
                        }
                    }
                }
                
                .frame(width: 250)
            }
            
        }
           
                .popup(isPresented: $showingPopUp) {
                    if let selected = selectedItem {
                        ZStack {
                            Image("popUp")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 320, height: 430)
                            
                            
                            VStack(spacing: 12) {
                                Image(selected.assetName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                
                                Text(selected.name)
                                    .font(.custom("Boba Milky", size: 24))
                                    .foregroundColor(.customBrown)
                                
                                Text(selected.description)
                                    .font(.custom("Boba Milky", size: 16))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.customBrown)
                                
                                Text(selected.powerText)
                                    .font(.custom("Boba Milky", size: 14))
                                    .foregroundColor(.customBrown)
                                
                                Text(selected.unlockText)
                                    .font(.custom("Boba Milky", size: 14))
                                    .foregroundColor(.customBrown)
                                
                                
                                Button(action: {
                                    print("buy")
                                }) {
                                    ZStack {
                                        Image("buyButton")
                                            .resizable()
                                            .frame(width: 100, height: 30)
                                        Text("\(selected.price) Buy")
                                            .font(.custom("Boba Milky", size: 14))
                                            .foregroundColor(.customBrown)
                                        
                                    }
                                }
                                
                            }
                            .frame(width: 250)
                        }
                    }
                }
        }
        

}



#Preview {
    storeScreen()
}

