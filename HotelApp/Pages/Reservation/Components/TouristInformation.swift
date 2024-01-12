//
//  TouristInformation.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 12/01/24.
//

import Foundation

struct Tourist: Identifiable, Hashable {
    let id: Int
    var expandMe: Bool = false
    var deleteMe: Bool = true
    var name: String = "Имя"
    var fieldName: String
    var surname: String = "Фамилия"
    var fieldSurname: String
    var dateOfBirth: String = "Дата рождения"
    var fieldDateOfBirth: String
    var citizenship: String = "Гражданство"
    var fieldCitizenship: String
    var passport: String = "Номер загранпасспорта"
    var fieldPassport: String
    var exparedDatePassort: String = "Срок действия загранпаспорта"
    var fieldExparedDatePassort: String
}
