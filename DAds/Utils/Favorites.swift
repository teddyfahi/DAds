//
//  Favorites.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 24/03/2023.
//

import Foundation
import SwiftUI

class Favorites: ObservableObject {
    public var ads: Set<String>
    let defaults = UserDefaults.standard
    
    // the key we're using to read/write in UserDefaults
    private let storedKey = "Favorites"
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.data(forKey: storedKey) {
            let adData = try? decoder.decode(Set<String>.self, from: data)
            self.ads = adData ?? []
        } else {
            self.ads = []
        }
        // load our saved data
    }
    
    // returns true if our set contains this resort
    func contains(_ ad: Item) -> Bool {
        ads.contains(ad.id)
    }
    
    // adds the resort to our set, updates all views, and saves the change
    func add(_ ad: Item) {
        objectWillChange.send()
        ads.insert(ad.id)
        save()
    }
    
    // removes the resort from our set, updates all views, and saves the change
    func remove(_ ad: Item) {
        objectWillChange.send()
        ads.remove(ad.id)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ads) {
            defaults.set(encoded, forKey: storedKey)
        }
        // write out our data
    }
    
    func toggleFavorite(ad: Item) {
        if contains(ad) {
            remove(ad)
        } else {
           add(ad)
        }
    }
}
