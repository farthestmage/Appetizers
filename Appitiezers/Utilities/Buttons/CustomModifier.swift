//
//  CustomModifier.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 26/04/25.
//

import SwiftUI


struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
    
extension  View{
    
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
