//
//  HomeCoordinator.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import Foundation
import SwiftUI

enum AllPages {
    case room
    case reservation
}

class HotelCoordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()

    @ViewBuilder func openAllPages(type: AllPages, path: Binding<NavigationPath>) -> some View {
        switch type {
        case .room:
            RoomsPage(path: path)
        case .reservation:
            ReservationPage(path: path)
        }
    }
}
