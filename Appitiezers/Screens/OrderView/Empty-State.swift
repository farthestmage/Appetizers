//
//  Empty-State.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 22/04/25.
//

import SwiftUI

struct Empty_State: View {
    
     let ImageName: String
    let message: String
    
    var body: some View {
        ZStack{
            
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack{
               Image(ImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y:-20)
        }
    }
}

#Preview {
    Empty_State(ImageName: "empty-order", message: "A bit of a Long Message to test")
}
