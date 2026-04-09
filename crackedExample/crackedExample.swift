//
//  crackedExample.swift
//  crackedExample
//
//  Created by Amat Addoais on 4/9/26.
//

import Foundation

import SwiftUI

@main

//What we did was created CrackedExampleApp which conforms to the 'App' protocol
//The 'App' protocl is fairly new, and was introduced with SwiftUI to allow for more efficient app launching
//TODO: More research on the App Protocol, WindowGroup, and the Scene protocol as well
struct crackedExampleApp : App {
    
    //TODO: Research this, but I belive that one of the requirments for the App protocol is a property 'body' which is an opaque type of some Scene
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
