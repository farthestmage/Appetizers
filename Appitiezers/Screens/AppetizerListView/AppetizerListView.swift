//
//  AppetizerListView.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewmodel = AppetizerListViewModel()
    @State private  var isshowingdetailview = false
    @State private var selectedappetizer: Appetizer?
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewmodel.appetizers){
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            isshowingdetailview = true
                            selectedappetizer = appetizer
                        }
                    
                }
                .navigationTitle("Appetizer")
                .disabled(isshowingdetailview)
                
            }
            .onAppear(){
                viewmodel.getAppetizer()
            }
            .blur(radius: isshowingdetailview ? 20 : 0)
            if isshowingdetailview {
                DetailView(appetizers: selectedappetizer!,
                           dismissx: $isshowingdetailview)
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
