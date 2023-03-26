//
//  Globals.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import SwiftUI

class Globals: ObservableObject {
    
    @Published var baseBlue = Color(red: 66 / 255, green: 124 / 255, blue: 172 / 255)
    @Published var cardDark = Color(red: 32/255, green: 36/255, blue: 38/255)
    @Published var cardLight = Color(red: 253 / 255, green: 253 / 255, blue: 253 / 255)
    
}
