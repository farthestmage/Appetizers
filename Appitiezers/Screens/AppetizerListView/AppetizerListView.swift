//
//  AppetizerListView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewmodel = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack{
            NavigationSplitView(){
                List(viewmodel.appetizers){
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                    
                }
                .navigationTitle("Appetizer")
                
            } detail: {
                Text("Appetizer List")
            }
            .onAppear(){
                viewmodel.getAppetizer()
            }
            if viewmodel.isLoading {
                SpinnerView()
            }
            
            
        }
        .alert(item: $viewmodel.alertitem){
            alertItem in
            Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dissmisButton)
        }
    }
        
    
}

#Preview {
    AppetizerListView()
}
