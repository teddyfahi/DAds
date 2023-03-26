//
//  MainViewModel.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 24/03/2023.
//

import Foundation

//extension MainView {
    
    final class MainViewModel: ObservableObject {

        @Published var imageBaseUrl: String = "https://images.finncdn.no/dynamic/480x360c/"
        @Published var searchText = ""
        @Published var selectedTab : Tabs = .All
        
        enum Tabs : String, CaseIterable {
            case All = "Everything"
            case Favorites = "Favorites"
        }
   // }
}
