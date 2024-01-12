//
//  PayInfo.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 12/01/24.
//

import Foundation

struct PayInfo {
    let tour: String = "Тур"
    var tourPrice: Int
    let fuel: String = "Топливный сбор"
    var fuelCharge: Int
    let service: String = "Сервисный сбор"
    var serviceCharge: Int
    let summary: String = "К оплате"
    var summaryCount: Int
    
    func sum() -> Int {
        return tourPrice + fuelCharge + serviceCharge
    }
}
