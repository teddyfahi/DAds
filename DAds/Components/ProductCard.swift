//
//  ProductCard.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 24/03/2023.
//

import SwiftUI

struct ProductCard: View {
    @StateObject private var favorites = Favorites()
    @StateObject private var globals = Globals()
    @StateObject private var vm = ProductViewModel()
    
    @State var isProductCard = true
    
    var productImage: String
    var price: Int
    var description: String?
    var location: String?
    var shippingOption: String?
    var adType: String
   
    var body: some View {
        HStack(alignment: .center) {
            ImageLoader(isProductCard: $isProductCard, productImage: productImage)
            VStack(alignment: .leading) {
                Text(vm.priceStringFromInt(price) ?? "No price available")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                Text(description ?? "No description available")
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .truncationMode(.tail)
                AdTypeView(adType: adType, location: location).padding([.top, .bottom], 8)
            }.padding(20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
