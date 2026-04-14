//
//  nestTile.swift
//  crackedExample
//
//  Created by Manar Hizam on 4/7/26.
//

import SwiftUI

struct StoreItem: Identifiable {
    
    let id=UUID()
    let name: String
    let assetName: String
    let description: String
    let powerText: String
    let unlockText: String
    let price: Int
    let category: String
}
struct nestTile: View {
    let item: StoreItem
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Button(action: onTap){
                VStack{
                    Image("nestBox")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height:160)
                    //.padding(40)
                        .overlay(
                            Image(item.assetName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .offset(y: -5)
                        )
                }
                
            }
            .buttonStyle(.plain)
        }
    }
}
    
    #Preview {
        nestTile(item: StoreItem(name : "Egg", assetName: "egg", description: "A basic egg", powerText: "No power", unlockText: "XP must reach :10", price:100, category: "Egg"),
                 onTap:{}
        )
    }
