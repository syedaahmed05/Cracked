//
//  popup.swift
//  crackedExample
//
//  Created by Manar Hizam on 4/21/26.
//


import SwiftUI

struct PopupModifier<PopupContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder let popupContent: () -> PopupContent
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
                popupContent()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}

extension View {
    func popup<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.modifier(PopupModifier(isPresented: isPresented, popupContent: content))
    }
}
