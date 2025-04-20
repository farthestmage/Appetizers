//
//  Nutrients.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 20/04/25.
//

import SwiftUI

struct Nutrients: View {
    var appetizers: Appetizer
    var body: some View {
        VStack(spacing: 5){
            Text("Calories")
                .font(.caption)
                .fontWeight(.bold)
            Text("\(appetizers.calories)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
        VStack(spacing: 5){
            Text("Carbs")
                .font(.caption)
                .bold()
            Text("\(appetizers.carbs) g")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
        VStack(spacing:5){
            Text("Protein")
                .font(.caption)
                .bold()
            Text("\(appetizers.protein) g")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

