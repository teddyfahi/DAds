//
//  FavoritesView.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favorites = Favorites()
    @StateObject private var vm = MainViewModel()
    @StateObject var globals = Globals()
    @EnvironmentObject private var repository: Repository
    
    var body: some View {
        VStack {
            if favorites.ads.count == 0 {
                VStack {
                    HStack {
                        Text("Nothing here yet")
                        Image(systemName: "heart.slash").imageScale(.large).foregroundColor(.red)
                    }
                    
                }.padding()
            } else {
                favsList.padding()
            }
            Spacer()
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("Favorites").foregroundColor(globals.cardDark)
            }
        }
    }
    
    var favsList: some View {
        ForEach(repository.items, id: \.id) { item in
            if favorites.contains(item) {
                ZStack(alignment: .top) {
                    ProductCard(productImage:  "\(vm.imageBaseUrl)\(item.image?.url ?? "")", price: item.price?.value ?? 0, description: item.description ?? "", location: item.location ?? "", adType: item.adType.rawValue)
                    HStack {
                        Spacer()
                        Image(systemName: favorites.contains(item) ? "heart.fill" : "heart").imageScale(.large).foregroundColor(.red).padding(20).onTapGesture() { favorites.toggleFavorite(ad: item) }
                    }
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

