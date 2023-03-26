//
//  ProductViewModel.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import Foundation

    class ProductViewModel: ObservableObject {

        func priceStringFromInt(_ integer: Int) -> String? {
            return String(integer) + " " + "kr"
        }
}

