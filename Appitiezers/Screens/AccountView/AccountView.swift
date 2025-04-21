//
//  AccountView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewmodel = AccountViewModel()
    
    var body: some View {
        NavigationView(){
            Form{
                Section ("Personal Info"){
                    
                    TextField("First Name", text: $viewmodel.user.firstname)
                    TextField("Last Name", text: $viewmodel.user.lastname)
                    TextField("Email", text: $viewmodel.user.emaiL)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                    
                    DatePicker ("Birthday", selection: $viewmodel.user.date ,displayedComponents: [.date])
                    Button(action:{viewmodel.savechanges()}){
                        Text("Save Changes")
                            .foregroundStyle(.gray)
                    }
                    
                }
                Section ("Requests") {
                    Toggle("Extra Napkins", isOn: $viewmodel.user.isNapkins)
                    Toggle("Refills", isOn: $viewmodel.user.isRefills)
                }
                .tint(.brandPrimary)
            }
                .navigationTitle("User-Account")
        }
        .onAppear() {
            viewmodel.retriveUser()
        }
        .alert(item: $viewmodel.alertitem){
            alertitem in
            Alert(title: alertitem.title,
                  message: alertitem.message,
                  dismissButton: alertitem.dissmisButton)
        }
    }
}

#Preview {
    AccountView()
}
