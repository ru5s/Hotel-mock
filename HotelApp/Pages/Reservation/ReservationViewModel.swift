//
//  ReservationModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation
import Combine

class ReservationViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var hotel: Hotel?
    @Published var summaryFields: [Summary] = []
    @Published var reservation: ReservationModel?
    @Published var tourists: [Tourist] = [
        Tourist(id: 0, expandMe: true, deleteMe: true, fieldName: "", fieldSurname: "", fieldDateOfBirth: "", fieldCitizenship: "", fieldPassport: "", fieldExparedDatePassort: "")
    ]
    @Published var numbersValues = [Numbers.first, Numbers.second, Numbers.third, Numbers.fourth, Numbers.fifth]
    @Published var payInfo: PayInfo = .init(tourPrice: 0, fuelCharge: 0, serviceCharge: 0, summaryCount: 0)
    @Published var phoneNum: String = ""
    func hotelDataStore() {
        DataStore.shared.value.sink { hotel in
            self.hotel = hotel
        }
        .store(in: &cancellables)
    }
    
    func getReservation() {
        NetworkService.shared.getReservationData { reservation, error in
            guard let unwrRooms = reservation, error == nil else {
                print("error in model \(error?.localizedDescription ?? "")")
                return
            }
            DispatchQueue.main.async {
                self.reservation = unwrRooms
                self.summaryFields.append(Summary(id: 0, nameField: "Вылет из", information: self.reservation?.departure ?? ""))
                self.summaryFields.append(Summary(id: 1, nameField: "Страна, город", information: self.reservation?.arrivalCountry ?? ""))
                self.summaryFields.append(Summary(id: 2, nameField: "Даты", information: "\(self.reservation?.tourDateStart ?? "") - \(self.reservation?.tourDateStop ?? "")"))
                self.summaryFields.append(Summary(id: 3, nameField: "Кол-во ночей", information: String(self.reservation?.numberOfNights ?? 0)))
                self.summaryFields.append(Summary(id: 4, nameField: "Отель", information: "Steigenberger Makadi"))
                self.summaryFields.append(Summary(id: 5, nameField: "Номер", information: self.reservation?.room ?? ""))
                self.summaryFields.append(Summary(id: 6, nameField: "Питание", information: self.reservation?.nutrition ?? ""))
                
                if let unwrReservation = self.reservation {
                    self.payInfo.tourPrice = unwrReservation.price
                    self.payInfo.fuelCharge = unwrReservation.fuelCharge
                    self.payInfo.serviceCharge = unwrReservation.serviceCharge
                    self.payInfo.summaryCount = self.payInfo.sum()
                }
                
            }
        }
    }
    
    func countOfToursts(count :Int) -> [String] {
        var result: [String] = []
        for index in 0..<min(count, numbersValues.count) {
            let stringValue = numbersValues[index].rawValue
            result.append(stringValue)
        }
        return result
    }
    
    func addTourist(index: Int) {
        tourists.append(.init(id: index, expandMe: false, deleteMe: false, fieldName: "", fieldSurname: "", fieldDateOfBirth: "", fieldCitizenship: "", fieldPassport: "", fieldExparedDatePassort: ""))
    }
    
    func removeTourist(index: Int) {
        if tourists.count > 1 {
            tourists.remove(at: index)
        }
        
    }
    
    func formatPhoneNumber(digits: String) -> String? {
        while digits.count < 13 {
            return digits
        }
        var formattedNumber: String = ""
        let firstDigits = "\(digits.dropFirst(3).prefix(3)) "
        let secondThree = digits.dropFirst(6).prefix(3)
        let thirdThree = digits.dropFirst(9).prefix(2)
        let fourthThwo = digits.dropFirst(11).prefix(2)
        
        formattedNumber = "+7 (\(firstDigits)) \(secondThree)-\(thirdThree)-\(fourthThwo)"
        if digits.count > 13 {
            return nil
        }
       
        return  formattedNumber
    }
}
