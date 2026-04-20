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
        
        StoreItem(name: "Punk Chicken", assetName: "punkChicken", description:" A chicken with a emo style", powerText:" Makes the power " , unlockText: "XP must reach: 30", price: 100, category: "Chicken"),
        
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
                    
                    
                    //     Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing:0){
                            Image("ChickenPlank")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .offset(y:-16)
                                .frame(height:110)
                            // figure out a way to keep it not moving down when i scroll down, scroll issue
                            
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
                        //  .offset(y:-39)
                        
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
                
                
            }
            
            HStack(spacing: 0){
                Button(action :{
                    print("button tapped!")
                }) {
                    Image("skinsButton")
                    
                        .scaledToFit( )
                        .frame(width :190, height:70)
                    
                }
                
                Button(action: {
                    print("button tapped!")
                })
                {
                    Image("powerupButton")
                        .scaledToFit()
                        .frame(width: 190, height:70)
                    
                }
                
                
            }
            .frame(maxWidth:.infinity)
            .offset(y:48)
        }
        if let selected = selectedItem {
            
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                //.frame(width: 440, height: 338)
            
                .onTapGesture {
                    selectedItem = nil
                }
            
            ZStack {
                Image("popUp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height:430)
                //pop up that appear when i click on itemBox
                
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
                    
                    Button("\(selected.price) Buy" ) {
                        print("buy")
                        
                            
                    }
                }
                //                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
    }
    
    }
//}
      

#Preview {
    storeScreen()
}
