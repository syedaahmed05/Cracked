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
}
struct nestTile: View {
    let item: StoreItem
    
    var body: some View {
        VStack {
            
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
}

#Preview {
    nestTile(item: StoreItem(name : "Egg", assetName: "egg"))
}

