//
//  AppetizerListViewModel.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 12/04/25.
//

import Foundation

import SwiftUI


@MainActor final class AppetizerListViewModel :  ObservableObject {
    @Published  var appetizers: [Appetizer] = []
    @Published  var alertitem: alertitems?
    @Published var isLoading : Bool = false
    
    @Published var isshowingdetailview = false
    @Published var selectedappetizer: Appetizer?
    
    
    
//    func getAppetizer () {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.sync {
//                isLoading = false
//                switch  result  {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidDATA:
//                        alertitem = alertcontext.invalidData
//                        
//                    case .invalidURL:
//                        alertitem = alertcontext.invalidURL
//                        
//                    case .invalidRESPONSE:
//                        alertitem = alertcontext.invalidResponse
//                        
//                    case .unabletoCompelete:
//                        alertitem = alertcontext.unableToComplete
//                        
//                    }
//                }
//            }
//        }
//    }
    func getAppetizer () {
        isLoading = true
        Task{
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }
            catch
            {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertitem = alertcontext.invalidURL
                    case .invalidRESPONSE:
                        alertitem = alertcontext.invalidResponse
                    case .invalidDATA:
                        alertitem = alertcontext.invalidData
                    case .unabletoCompelete:
                        alertitem = alertcontext.unableToComplete
                    }
                }else {
                    alertitem = alertcontext.invalidResponse
                }
                alertitem = alertcontext.invalidResponse
                isLoading = false
            }
        }
    }
}
