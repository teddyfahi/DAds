//
//  CardModifier.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import SwiftUI

struct CardModifier: ViewModifier {
    @StateObject var globals = Globals()
    
    func body(content: Content) -> some View {
        content
            .background(globals.cardDark)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}
