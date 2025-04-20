//
//  APButton.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 20/04/25.
//

import SwiftUI

struct APButton: View {
    var appetizers: Appetizer
    var body: some View {
        Text("$ \(appetizers.price,specifier: "%.2f") - Add To Order")
            .frame(width: 260,height: 50)
            .background(.brandPrimary)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

struct Dismiss: View {
    var body: some View {
        Image(systemName: "x.circle.fill")
            .symbolRenderingMode(.palette)
            .foregroundStyle(.secondary,.white)
            .font(.system(size: 25))
            .opacity(0.5)
    }
}
