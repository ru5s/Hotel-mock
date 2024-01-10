//
//  HotelModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation

struct ButtonInHotelPage: Hashable {
    let name: String
    let description: String
    let icon: String
    let arrow: String
}

class HotelViewModel: ObservableObject {
    @Published var hotel: Hotel?
    
    @Published var buttons: [ButtonInHotelPage] = [
        .init(name: "Удобства", description: "Самое необходимое", icon: "emoji-happy", arrow: "chevron.right"),
        .init(name: "Что включено", description: "Самое необходимое", icon: "tick-square", arrow: "chevron.right"),
        .init(name: "Что не включено", description: "Самое необходимое", icon: "close-square", arrow: "chevron.right")
    ]
    
    func getHotel(competion: @escaping () -> Void) {
        NetworkService.shared.getHotelFromApi { hotel, error in
            guard let unwrHotel = hotel, error == nil else {
                print("error in model \(error?.localizedDescription ?? "")")
                return
            }
            DispatchQueue.main.async {
                self.hotel = unwrHotel
                competion()
            }
        }
    }
    
    func sharedHotel() {
        DataStore.shared.value.send(hotel ?? Hotel(id: 0, name: "", adress: "", minimalPrice: 0, priceForIt: "", rating: 0, ratingName: "", imageUrls: [], aboutHotel: AboutHotel(description: "", peculiarities: [])))
    }
}
