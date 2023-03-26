//
//  ProductView.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import SwiftUI

struct ProductView: View {
    @StateObject var globals = Globals()
    
    var item: Item
    var vm: MainViewModel
    var favorites: Favorites
    
    var body: some View {
        VStack {
            Product(productImage: "\(vm.imageBaseUrl)\(item.image?.url ?? "")", price: item.price?.value ?? 0, description: item.description, location: item.location, shippingOption: item.shippingOption?.label.rawValue, adType: item.adType.rawValue)
            Spacer()
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Image(systemName: favorites.contains(item) ? "heart.fill" : "mustache").imageScale(.large).foregroundColor(globals.cardDark)
            }
        }
    }
}
