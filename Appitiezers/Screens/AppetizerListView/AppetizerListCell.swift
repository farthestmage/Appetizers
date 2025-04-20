//
//  AppetizerListCell.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 11/04/25.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer : Appetizer
    var body: some View {
        HStack{
                            //RoundedRectangle(cornerRadius: 20)
                            
            AppetizerremoteImage(urlString: appetizer.imageURL)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120,height: 90)
                                .cornerRadius(8)

                            VStack (alignment: .leading,spacing: 5){
                                Text(appetizer.name)
                                    .font(.title2)
                                    .bold()
                                
                                Text("$\(appetizer.price, specifier: "%.2f")")
                                    .foregroundStyle(.secondary)
                                    .fontWeight(.semibold)
                            
                            }
                            .padding()
                        }

    }
    
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
