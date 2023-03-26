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
    
    var productImage: String
    var price: Int
    var description: String
    var location: String
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

                Text("\(price) kr")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                Text(description)
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
                    Text(location)
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

//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(productImage: "bilde", price: 00, description: "description", location: "title", adType: "houses")
//    }
//}
