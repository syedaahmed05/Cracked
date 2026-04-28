
//  customHaptics.swift
//  MyCracked
//
//  Created by Amat Addoais on 4/26/26.
//

import CoreHaptics
import SpriteKit


extension GameScene {
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            self.hapticEngine = try CHHapticEngine()
            try self.hapticEngine?.start()
        } catch {
            print("There was an error creating the haptic engine: \(error)")
        }
    }
    
    //TODO: Custom hapatic when the player loses a life
    func playLoseLifeHaptic() {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        
        // The initial "Crack" (Transient)
        let shockwave = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

        // The "Rumble" (Continuous) - lasts for 0.25 seconds to add weight
        let rumble = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.25)
        
        do {
            let pattern = try CHHapticPattern(events: [shockwave, rumble], parameters: [])
            let player = try hapticEngine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print(error)
        }
    }
    
    //TODO: Custom haptic when player swipes the feather
    func playSwooshHaptic() {
        // Define the strength and sharpness
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        // Lower sharpness feels "airier"

        // Create a continuous rumble that lasts for the duration of a swipe (e.g., 0.4 seconds)
        let continuousEvent = CHHapticEvent(eventType: .hapticContinuous,
                                            parameters: [intensity, sharpness],
                                            relativeTime: 0,
                                            duration: 0.5)

        // Create a "Fade In" and "Fade Out" curve so it feels like a 'whoosh'
        // This starts at 0 power, peaks at 1.0, and ends at 0
        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: [
                CHHapticParameterCurve.ControlPoint(relativeTime: 0, value: 0.0),
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.15, value: 1.0), // Peak of the swipe
                CHHapticParameterCurve.ControlPoint(relativeTime: 0.4, value: 0.0)  // Fade away
            ],
            relativeTime: 0
        )

        do {
            // Combine the event and the curve into a pattern
            let pattern = try CHHapticPattern(events: [continuousEvent], parameterCurves: [intensityCurve])
            let player = try hapticEngine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Swoosh error: \(error)")
        }
    }
    
    func playEggCrackHaptic() {
        // The Initial Sharp Break
        // High intensity and high sharpness to feel like brittle shell
        let crackIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let crackSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
        
        let crackEvent = CHHapticEvent(eventType: .hapticTransient,
                                       parameters: [crackIntensity, crackSharpness],
                                       relativeTime: 0)

        // The Soft Release (The "Goo")
        // Lower sharpness makes it feel "soft" or "liquid"
        let gooIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6)
        let gooSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        
        // This starts almost instantly (0.05s) and rumbles briefly
        let gooEvent = CHHapticEvent(eventType: .hapticContinuous,
                                     parameters: [gooIntensity, gooSharpness],
                                     relativeTime: 0.05,
                                     duration: 0.15)

        // Play the Pattern
        do {
            let pattern = try CHHapticPattern(events: [crackEvent, gooEvent], parameters: [])
            let player = try hapticEngine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Egg crack error: \(error)")
        }
    }
    
    
    
    
}
