//
//  RoomsModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation

struct Rooms: Codable {
    let rooms: [Room]
}

struct Room: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
