//
//  AccountViewModel.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 20/04/25.
//

import Foundation
import SwiftUI


final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userdata: Data?
    @Published var user = User()
    
    @Published var alertitem : alertitems?
    
    var isvalidform: Bool {
        guard !user.firstname.isEmpty && !user.lastname.isEmpty && !user.emaiL.isEmpty
        else {
            alertitem = alertcontext.invalidForm
            return false
        }
        guard user.emaiL.isValidEmail else {
            alertitem = alertcontext.invalidEmail
            return false
        }
        return true
    }
    
    func savechanges () {
        guard isvalidform else {return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userdata = data
            alertitem = alertcontext.usersavesucess
        }
        catch {
            alertitem = alertcontext.invalidUserData
        }
    }
    func retriveUser() {
        guard let userdata else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userdata)
        }
        catch {
            alertitem = alertcontext.invalidUserData
        }
    }
    
}
