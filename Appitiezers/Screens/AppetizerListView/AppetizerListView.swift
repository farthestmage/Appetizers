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
            NavigationView{
                List(viewmodel.appetizers){
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewmodel.isshowingdetailview = true
                            viewmodel.selectedappetizer = appetizer
                        }
                    
                }
                .listStyle(.plain)
                .navigationTitle("Appetizer")
                .disabled(viewmodel.isshowingdetailview)
                
            }
//            .onAppear(){
//                viewmodel.getAppetizer()
//            }
            .task {
                viewmodel.getAppetizer()
            }
            .blur(radius: viewmodel.isshowingdetailview ? 20 : 0)
            if viewmodel.isshowingdetailview {
                DetailView(appetizers: viewmodel.selectedappetizer!,
                           dismissx: $viewmodel.isshowingdetailview)
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
