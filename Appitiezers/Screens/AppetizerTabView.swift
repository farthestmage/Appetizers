//
//  ContentView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem{
                    Image(systemName: "house")
                        .renderingMode(.template)
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .tint(.brandPrimary)
        
        
    }
}

#Preview {
    AppetizerTabView()
}

