//
//  OrderView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.OrderItems
    
    var body: some View {
        NavigationView(){
            VStack {
                List {
                    ForEach(orderItems) {
                        OrderItem in
                        AppetizerListCell(appetizer: OrderItem)
                    }
                    .onDelete(perform: deleteItems )
                
                }
                .listStyle(.plain)
                Button(action:{}){
                    APButton(title: "Hello")
                       
                }
                .padding(.bottom,25)
            }
                .navigationTitle("Orders")
        }
    }
    func deleteItems (at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
