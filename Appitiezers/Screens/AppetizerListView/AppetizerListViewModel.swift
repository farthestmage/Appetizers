//
//  AppetizerListViewModel.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 12/04/25.
//

import Foundation

import SwiftUI


final class AppetizerListViewModel :  ObservableObject {
    @Published  var appetizers: [Appetizer] = []
    @Published  var alertitem: alertitems?
    @Published var isLoading : Bool = false
    
    @Published var isshowingdetailview = false
    @Published var selectedappetizer: Appetizer?
    
    
    
    func getAppetizer () {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.sync {
                isLoading = false
                switch  result  {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidDATA:
                        alertitem = alertcontext.invalidData
                        
                    case .invalidURL:
                        alertitem = alertcontext.invalidURL
                        
                    case .invalidRESPONSE:
                        alertitem = alertcontext.invalidResponse
                        
                    case .unabletoCompelete:
                        alertitem = alertcontext.unableToComplete
                        
                    }
                }
            }
        }
    }
}
