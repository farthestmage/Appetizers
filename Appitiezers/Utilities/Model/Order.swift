//
//  Order.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 23/04/25.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalprice : Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func add (_ appetizer:Appetizer){
        
        items.append(appetizer)
    }
    
}

