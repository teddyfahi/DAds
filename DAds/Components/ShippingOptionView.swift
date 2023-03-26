//
//  ShippingOptionView.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 26/03/2023.
//

import SwiftUI

struct ShippingOptionView: View {
    
    @StateObject var globals = Globals()
    var shippingOption: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "hare").imageScale(.medium)
                Text(shippingOption)
            }.padding(6).background(.yellow.opacity(0.2)).clipShape(RoundedRectangle(cornerRadius: 6.0))
            Spacer()
        }.foregroundColor(globals.cardLight)    }
}

struct ShippingOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingOptionView(shippingOption: "")
    }
}
