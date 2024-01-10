//
//  HotelModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation

struct Hotel: Codable, Hashable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutHotel: AboutHotel
    
    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutHotel = "about_the_hotel"
    }
}

struct AboutHotel: Codable, Hashable {
    let description: String
    let peculiarities: [String]
}
