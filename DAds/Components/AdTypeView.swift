//
//  AdTypeView.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 26/03/2023.
//

import SwiftUI

struct AdTypeView: View {
    @StateObject var globals = Globals()
    
    let adType: String?
    let location: String?
    
    var body: some View {
        
        HStack (spacing: 4.0) {
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
        }
    }
}

struct AdTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AdTypeView(adType: "", location: "")
    }
}
