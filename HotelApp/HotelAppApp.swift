//
//  HotelAppApp.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI

@main
struct HotelAppApp: App {
    var body: some Scene {
        @StateObject var coordinator: HotelCoordinator = HotelCoordinator()
        WindowGroup {
            HotelPage(coordinator: coordinator)
        }
    }
}
