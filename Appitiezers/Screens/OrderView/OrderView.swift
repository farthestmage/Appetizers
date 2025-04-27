//
//  OrderView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

struct OrderView: View {
    
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView(){
            ZStack{
                VStack {
                    List {
                        ForEach(order.items) {
                            OrderItem in
                            AppetizerListCell(appetizer: OrderItem)
                        }
                        .onDelete(perform: deleteItems  )
                    
                    }
                    .listStyle(.plain)
                    Button(action:{}){
//                        APButton(title: "\(order.totalprice,specifier: "%.2f") - Place Order ")
                        Text("$ \(order.totalprice, specifier: "%.2f") - Add To Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom,25)
                }
                if order.items.isEmpty {
                    Empty_State(ImageName: "empty-order", message: "You have no items in your order. \n Please Add an Appetizers!")
                }
            }
            
                .navigationTitle("Orders")
        }
    }
    func deleteItems (at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
