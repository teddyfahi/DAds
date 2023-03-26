//
//  Product.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import SwiftUI

struct Product: View {
    @StateObject private var favorites = Favorites()
    @StateObject private var globals = Globals()
    @StateObject private var vm = ProductViewModel()
    @State var isProductCard = false
    
    var productImage: String
    var price: Int
    var description: String?
    var location: String?
    var shippingOption: String?
    var adType: String
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 16.0) {
                if shippingOption != nil {
                    ShippingOptionView(shippingOption: shippingOption!)
                }
                ImageLoader(isProductCard: $isProductCard, productImage: productImage)
                AdTypeView(adType: adType, location: location).foregroundColor(globals.cardLight).padding(.bottom, 16)
            }
            .frame(width: 300)
            .background(globals.cardDark)
            .clipShape(RoundedRectangle(cornerRadius: 24.0))
            .shadow(radius: 2)
        }.padding()
        VStack {
            Text(vm.priceStringFromInt(price) ?? "No price available")
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(.orange)
            Divider()
            Text(description ?? "Nothing to know about this ad")
        }.frame(width: 300).padding()
    }
}


struct Product_Previews: PreviewProvider {
    static var previews: some View {
        Product(productImage: "", price: 1, adType: "")
    }
}
