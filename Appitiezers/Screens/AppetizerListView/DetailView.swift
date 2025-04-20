//
//  DetailView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 19/04/25.
//

import SwiftUI

struct DetailView: View {
    let appetizers: Appetizer
    
    
    var body: some View {
        VStack(){
            Image ("asian-flank-steak")
                .resizable()
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
                HStack(spacing: 30){
                    VStack{
                        Text("Calories")
                        Text("\(appetizers.calories)")
                    }
                    VStack{
                        Text("Carbs")
                        Text("\(appetizers.carbs) g")
                    }
                    VStack{
                        Text("Calories")
                        Text("\(appetizers.protein) g")
                    }
                }
            }
            Spacer()
            
            Button(action: {}) {
                Text("$ \(appetizers.price,specifier: "%.2f") - Add To Order")
                      .padding()
                      .foregroundColor(.white)
                      .background(.mint)
                      .cornerRadius(10)
                      .bold()
                      .font(.title2)
            }.padding(.bottom,30)
            
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}

#Preview {
    DetailView(appetizers: MockData.sampleAppetizer)
}
