//
//  Alerts.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 12/04/25.
//

import Foundation
import SwiftUI

struct alertitems: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dissmisButton: Alert.Button
}
struct alertcontext {
    static let invalidData      = alertitems(title: Text("Server Error"),
                                              message: Text("The data recieved from the server was invalid"),
                                              dissmisButton: .default(Text("OK")))
    static let invalidResponse  = alertitems(title: Text("Server Error"),
                                              message: Text("Invalid Response from the server. "),
                                              dissmisButton: .default(Text("OK")))
    static let invalidURL       = alertitems(title: Text("Server Error"),
                                              message: Text("There was an issue connecting to the server "),
                                              dissmisButton: .default(Text("OK")))
    static let unableToComplete = alertitems(title: Text("Server Error"),
                                              message: Text("Unable to complete your Request this time please check your internet connection"),
                                              dissmisButton: .default(Text("OK")))
}

