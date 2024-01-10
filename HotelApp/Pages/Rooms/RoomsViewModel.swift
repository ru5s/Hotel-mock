//
//  RoomsModel.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation

class RoomsViewModel: ObservableObject {
    @Published var rooms: Rooms?

    func getRomms() {
        NetworkService.shared.getRoomsFromApi { rooms, error in
            guard let unwrRooms = rooms, error == nil else {
                print("error in model \(error?.localizedDescription ?? "")")
                return
            }
            DispatchQueue.main.async {
                self.rooms = unwrRooms
            }
        }
    }
}
