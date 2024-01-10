//
//  HomeCoordinator.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation
import SwiftUI

class HotelCoordinator: ObservableObject {

    func openRoomsPage(path: NavigationPath) -> some View {
        let roomsPage = RoomsPage(path: .constant(path))
        return roomsPage
    }
}
