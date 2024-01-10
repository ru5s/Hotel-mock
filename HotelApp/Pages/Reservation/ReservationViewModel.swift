//
//  ReservationModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation
import Combine

struct Summary: Identifiable, Hashable {
    var id: Int
    let nameField: String
    let information: String
}
struct Summary2: Identifiable, Hashable {
    var id: Int
    let nameField: String
    let information: String
}
class ReservationViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var hotel: Hotel?
    @Published var summaryFields: [Summary] = []
    @Published var reservation: ReservationModel?
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
            }
        }
    }
}
