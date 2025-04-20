//
//  AppetizerModel.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 05/04/25.
//



import SwiftUI



struct Appetizer: Decodable,Identifiable {
    let id : Int
    let calories : Int
    let name : String
    let description: String
    let price: Double
    let protein: Int
    let carbs: Int
    let imageURL: String
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1, calories: 20, name: "Test Appetizer",
                                           description: "Testing fucking less gooo ", price: 99.99,
                                           protein: 10, carbs: 20, imageURL: "")
    static let ListAppetizer = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
