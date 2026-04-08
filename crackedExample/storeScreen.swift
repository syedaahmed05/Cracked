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
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    Image("xpRectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .offset(y:-30)
                    
                    Image("ChickenPlank")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .offset(y:-30)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(chickenItems) { item in
                                nestTile(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Image("eggsWoodenPlank")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .offset(y:-60)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(eggItems) { item in
                                nestTile(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Image("chefPlank")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .offset(y:-57)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(chefItems) { item in
                                nestTile(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 100)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    storeScreen()
}
