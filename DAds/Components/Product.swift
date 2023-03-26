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
                    HStack {
                        HStack {
                            Image(systemName: "hare").imageScale(.medium)
                            Text(shippingOption!)
                        }.padding(6).background(.yellow.opacity(0.2)).clipShape(RoundedRectangle(cornerRadius: 6.0))
                        Spacer()
                    }.foregroundColor(globals.cardLight)
                }
                AsyncImage(url: URL(string: productImage), scale: 3) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 300)
                            .padding()
                    }
                    else if phase.error != nil {
                        Image(systemName: "mustache").font(.system(size: 60)).foregroundColor(globals.cardLight)
                            .frame(width: 120)
                            .padding(20)
                    }
                }
                HStack(spacing: 4.0) {
                    if adType == "REALESTATE" {
                        Image(systemName: "house").imageScale(.medium).foregroundColor(globals.cardLight)
                    } else {
                        Image(systemName: "location.circle").imageScale(.medium).foregroundColor(globals.cardLight)
                    }
                    Text(location ?? "No location available")
                }.foregroundColor(globals.cardLight)
                    .padding(.bottom, 16)
            }
            .frame(width: 300)
            .background(globals.cardDark)
            .clipShape(RoundedRectangle(cornerRadius: 24.0))
            .shadow(radius: 2)
            
        }.padding()
        VStack {
            Text("\(price) kr")
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
