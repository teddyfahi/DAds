//
//  Model.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 24/03/2023.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let items: [Item]
    let size: Int
    let version: String
}

// MARK: - Item
struct Item: Codable {
    let description: String?
    let id, url: String
    let adType: AdType
    let location: String?
    let type: ItemTypeEnum
    let price: Price?
    let image: ProductImage?
    let score: Double
    let version: Version
    let favourite: Favourite
    let shippingOption: ShippingOption?

    enum CodingKeys: String, CodingKey {
        case description, id, url
        case adType = "ad-type"
        case location, type, price, image, score, version, favourite, shippingOption
    }
}

enum AdType: String, Codable {
    case b2B = "B2B"
    case bap = "BAP"
    case realestate = "REALESTATE"
}

// MARK: - Favourite
struct Favourite: Codable {
    let itemID: String
    let itemType: ItemType

    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case itemType
    }
}

enum ItemType: String, Codable {
    case ad = "Ad"
}

// MARK: - Image
struct ProductImage: Codable {
    let url: String
    let height, width: Int
    let type: ImageType
    let scalable: Bool
}

enum ImageType: String, Codable {
    case general = "GENERAL"
}

// MARK: - Price
struct Price: Codable {
    let value: Int
    let total: Int?
}

// MARK: - ShippingOption
struct ShippingOption: Codable {
    let label: ProductLabel
}

enum ProductLabel: String, Codable {
    case fiksFerdig = "Fiks ferdig"
}

enum ItemTypeEnum: String, Codable {
    case ad = "AD"
}

enum Version: String, Codable {
    case mulPopThompzon = "mul-pop-thompzon"
}
