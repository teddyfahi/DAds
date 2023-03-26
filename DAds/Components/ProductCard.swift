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
    
    var productImage: String
    var price: Int
    var description: String?
    var location: String?
    var shippingOption: String?
    var adType: String
   
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: productImage), scale: 3) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 120)
                        .padding([.top, .bottom, .leading], 20)
                    
                }
                else if phase.error != nil {
                    Image(systemName: "mustache").font(.system(size: 60)).foregroundColor(globals.cardLight)
                        .frame(width: 120)
                        .padding([.top, .bottom, .leading], 20)
                }
            }
            
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
                HStack {
                    if adType == "REALESTATE" {
                        Image(systemName: "house").imageScale(.medium).foregroundColor(globals.cardLight)
                    } else {
                        Image(systemName: "location.circle").imageScale(.medium).foregroundColor(globals.cardLight)
                    }
                    Text(location ?? "No location available")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }.padding([.top, .bottom], 8)
            }.padding(20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(globals.cardDark)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
