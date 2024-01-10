//
//  ReservationModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 10/01/24.
//

import Foundation

struct ReservationModel: Codable, Hashable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let rating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let price: Int
    let fuelCharge: Int
    let serviceCharge: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case rating = "horating"
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room, nutrition
        case price = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}
