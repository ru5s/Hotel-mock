//
//  RoomsCoordinator.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation
import SwiftUI

class RoomsCoordinator: ObservableObject {
    @Published var openReservation: (_ path: NavigationPath) -> Void = {_ in}
//    func openReservationPage(path: NavigationPath) -> some View {
//        let roomsPage = ReservationPage(path: $path)
//        return roomsPage
//    }
}

extension RoomsCoordinator: RoomsDelegate {
    func openPage(path: NavigationPath) {
        openReservation(path)
    }
}
