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
    
    //MARK: - Network Alerts
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
    
    //MARK: - Account Alerts
    
    static let invalidForm = alertitems(title: Text("Invalid Form"),
                                              message: Text("Please Ensure all the forms in the fields are filled out."),
                                              dissmisButton: .default(Text("OK")))
    static let invalidEmail = alertitems(title: Text("Invalid Email"),
                                              message: Text("Please Ensure email entered is valid."),
                                              dissmisButton: .default(Text("OK")))
    static let usersavesucess = alertitems(title: Text("Profile Saved"),
                                              message: Text("Profile Saved"),
                                              dissmisButton: .default(Text("OK")))
    static let invalidUserData = alertitems(title: Text("Invalid User"),
                                              message: Text("There was An error while retriving a data"),
                                              dissmisButton: .default(Text("OK")))
}


