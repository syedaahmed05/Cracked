//
//  storeScreen.swift
//  crackedExample
//
//  Created by Manar Hizam on 4/7/26.
//

import SwiftUI

struct storeScreen: View {
    @State private var selectedItem: StoreItem? = nil
    
    
    let chickenItems = [
    StoreItem(name: "CowBoy Chicken", assetName: "cowboyChicken", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Chicken"),
        
        StoreItem(name: "CowBoy Chicken", assetName: "cowboyChicken", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Chicken"),
        
        StoreItem(name: "CowBoy Chicken", assetName: "cowboyChicken", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Chicken"),
        
        
    ]
    
    let eggItems = [
        StoreItem(name: "Robot Egg", assetName: "robotEgg", description:" An Egg that gives you life back", powerText:" Looks cool and techy" , unlockText: "XP must reach: 30", price: 100, category: "Egg"),
        
        StoreItem(name: "Dragen Egg", assetName: "dragenEgg", description:" An egg that has strong and medievil essence", powerText:" Fire bonus" , unlockText: "XP must reach: 40", price: 100, category: "Egg"),
        
        StoreItem(name: "Rocket Egg", assetName: "rocketEgg", description:" A rocket egg that makes you feel like your in space", powerText:" Makes you heal" , unlockText: "XP must reach: 40", price: 100, category: "Egg"),
        
        StoreItem(name: "Bat egg", assetName: "batEgg", description:" A spooky egg that for a spooky feel", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Egg"),
        
        StoreItem(name: "Tumble weed", assetName: "tumbleWeed", description: "A dry climate coyboy themed egg", powerText:" Pairs well with cowboy chicken", unlockText:" XP much reach: 60", price: 130, category: "Egg"),
        
    ]
    
    let chefItems = [
        
        StoreItem(name: "Chef1", assetName: "egg", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Egg"),
        
        StoreItem(name: "Chef2", assetName: "egg", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Egg"),
        
        StoreItem(name: "Chef3", assetName: "egg", description:" A chicken with a cowboy style", powerText:" Looks cool in coop" , unlockText: "XP must reach: 10", price: 100, category: "Egg")
        //i will add the chefs when we have them
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("storeBackground")
                .resizable()
                .ignoresSafeArea()
            
                        //            ScrollView(.vertical, showsIndicators: false) {
            //                          VStack(spacing: 30) {
            VStack(spacing: 0){
                ZStack{
                    HStack{
                        Image("coinBox")
                        // .resizeable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x:-15, y:-10)
                        
                        Spacer()
                        
                        Image("xpRectangle")
                        //  .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x:-150, y: -10)
                    }
                    .padding(.horizontal,20)
                    
                    Text("SHOP")
                        .font(.custom("Super Meatball", size: 50))
                        .foregroundStyle(.orange)
                        .offset(x:120, y: -20)
                    
                }
                .padding(.top, 20)
                .padding(.bottom,10)
                
                
                VStack(spacing: 0) {
                    
                    //                    Image("ChickenPlank")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(maxWidth: .infinity)
                    //                        .offset(y:-16)
                    //                        .frame(height:110)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing:0){
                            Image("ChickenPlank")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .offset(y:-16)
                                .frame(height:110)
                                // Spacer()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(chickenItems) { item in
                                        nestTile(item: item){
                                            selectedItem = item
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            //  .offset(y:-1)
                            
                            Image("eggsWoodenPlank")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height:170)
                            //
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(eggItems) { item in
                                        nestTile(item: item){
                                            selectedItem = item
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .offset(y:-12)
                        
                        Image("chefPlank")
                            .resizable()
                        // .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                        //   .offset(y:-39)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(chefItems) { item in
                                    nestTile(item: item){
                                        selectedItem = item
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .offset(y:-12)
                        
                    }
                    .padding(.bottom,110)
                }
                //here
                
            }
            
            HStack(spacing: 0){
                Button(action :{
                    print("button tapped!")
                }) {
                    Image("skinsButton")
                    
                        .scaledToFit( )
                        .frame(width :190, height:70)
                    //  .offset(x:-100, y: -20)
                    // .offset(x:-90, y:162)
                }
                
                Button(action: {
                    print("button tapped!")
                })
                {
                    Image("powerupButton")
                        .scaledToFit()
                        .frame(width: 190, height:70)
                    //  .offset(x:110, y: 62)
                }
                
                
            }
            .frame(maxWidth:.infinity)
            .offset(y:48)
        }
        if let selected = selectedItem {

            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    selectedItem = nil
                }

            ZStack {
                Image("itemsBox") // 👈 your asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360) // make it bigger

                VStack(spacing: 12) {

                    Image(selected.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)

                    Text(selected.name)
                        .font(.custom("Super Meatball", size: 24))

                    Text(selected.description)
                        .font(.custom("Boba Milky", size: 16))
                        .multilineTextAlignment(.center)

                    Text(selected.powerText)
                        .font(.custom("Boba Milky", size: 14))

                    Text(selected.unlockText)
                        .font(.custom("Boba Milky", size: 14))

                    Button("\(selected.price) Buy") {
                        print("buy")
                    }
                }
                .frame(width: 260) // keeps text inside the box
            }
        }}
            }
            
      

#Preview {
    storeScreen()
}

