//
//  AppitiezersApp.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

@main
struct AppitiezersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
