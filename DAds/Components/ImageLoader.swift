//
//  ImageLoader.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 26/03/2023.
//

import SwiftUI

struct ImageLoader: View {
    @StateObject private var globals = Globals()
    @Binding var isProductCard: Bool
    var productImage: String
    
    var body: some View {
        AsyncImage(url: URL(string: productImage), scale: 3) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: isProductCard ? 120 : 300)
                    .padding([.top, .bottom, .leading], 20)
                
            }
            else if phase.error != nil {
                Image(systemName: "mustache").font(.system(size: 60)).foregroundColor(globals.cardLight)
                    .frame(width: 120)
                    .padding([.top, .bottom, .leading], 20)
            }
        }
    }
}
