//
//  storeScreen.swift
//  crackedExample
//
//  Created by Manar Hizam on 4/7/26.
//
import SwiftUI

struct storeScreen: View {
    
    
    let chickenItems = [
        StoreItem(name: "Chicken 1", assetName: "egg"),
        StoreItem(name: "Chicken 2", assetName: "egg"),
        StoreItem(name: "Chicken 3", assetName: "egg")
    ]
    
    let eggItems = [
        StoreItem(name: "Egg 1", assetName: "egg"),
        StoreItem(name: "Egg 2", assetName: "egg"),
        StoreItem(name: "Egg 3", assetName: "egg")
    ]
    
    let chefItems = [
        StoreItem(name: "Chef 1", assetName: "egg"),
        StoreItem(name: "Chef 2", assetName: "egg"),
        StoreItem(name: "Chef 3", assetName: "egg")
    ]
    
    var body: some View {
        ZStack {
            Image("storeBackground")
                .resizable()
                .ignoresSafeArea()
            
//                        ScrollView(.vertical, showsIndicators: false) {
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
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                    
                    Image("ChickenPlank")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .offset(y:-10)
                        .frame(height:110)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(chickenItems) { item in
                                nestTile(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .offset(y:-12)
                    
                    Image("eggsWoodenPlank")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height:170)
                        .offset(y:-40)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(eggItems) { item in
                                nestTile(item: item)
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
                        .offset(y:-39)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(chefItems) { item in
                                nestTile(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .offset(y:-12)
                }
                //.padding(.top, 100)
                .padding(.bottom, 30)
            }
        }
    }

}
}

#Preview {
    storeScreen()
}
