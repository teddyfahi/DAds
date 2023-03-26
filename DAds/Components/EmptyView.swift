//
//  EmptyView.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Nothing here yet")
                Image(systemName: "heart.slash").imageScale(.large).foregroundColor(.red)
            }
            Spacer()
        }.padding()
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
