//
//  MainView.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 24/03/2023.
//

import SwiftUI


struct MainView: View {
    @EnvironmentObject private var repository: Repository
    @StateObject var globals = Globals()
    @StateObject var favorites = Favorites()
    @StateObject private var vm = MainViewModel()
    
    var filteredAdItems: [Item] {
        switch vm.selectedTab {
        case .All:
            if vm.searchText.isEmpty {
                return repository.items
            } else if !repository.items.description.isEmpty {
                return repository.items.filter { $0.description!.localizedCaseInsensitiveContains(vm.searchText) }
            }
            return repository.items
        case .REALESTATE:
            return repository.items.filter { $0.adType.rawValue == "REALESTATE" }
        }
    }
    
    var body: some View {
        Picker("", selection: $vm.selectedTab) {
            ForEach(MainViewModel.Tabs.allCases, id: \.self) { option in
                Text(option.rawValue)
            }
        }.pickerStyle(.segmented).searchable(text: $vm.searchText, prompt: "Ads for dads search")
        ScrollView {
            LazyVStack {
                ForEach(filteredAdItems, id: \.id) { item in
                    NavigationLink(destination: ProductView(item: item, vm: vm, favorites: favorites).environmentObject(self.repository)) {
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
        }.refreshable { await repository.loadData() }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
