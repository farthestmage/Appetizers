//
//  DetailView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 19/04/25.
//

import SwiftUI
import UIKit
import Foundation

struct DetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizers: Appetizer
    @Binding var dismissx: Bool
    
    var body: some View {
        VStack(){
            AppetizerremoteImage(urlString: appetizers.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            VStack{
                Text(appetizers.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(appetizers.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    Nutrients(appetizers: appetizers)
                }
            }
            Spacer()
            
            Button(action: {order.add(appetizers)
                            dismissx = false}) {
               // APButton(title: "$ \(appetizers.price, specifier: "%.2f") - Add To Order")
                Text("$ \(appetizers.price, specifier: "%.2f") - Add To Order")
                    
            }
                            .modifier(StandardButtonStyle())
//                            .buttonStyle(.bordered)
//                            .tint(.brandPrimary)
//                            .controlSize(.large)
                            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing){
            Button(action:{ dismissx = false }){
                Dismiss()
            }
            
        }
    }
}

#Preview {
    DetailView(appetizers: MockData.sampleAppetizer, dismissx: .constant(true))
}
