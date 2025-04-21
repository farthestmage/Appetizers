//
//  User.swift
//  Appitiezers
//
//  Created by Arnav Kamboj on 20/04/25.
//

import Foundation
import SwiftUI


struct User : Codable {
    var firstname : String = ""
    var lastname  : String = ""
    var emaiL     : String = ""
    var date      : Date   = Date()
    var isNapkins : Bool   = true
    var isRefills : Bool   = false
}
