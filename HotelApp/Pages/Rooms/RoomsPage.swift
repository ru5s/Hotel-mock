//
//  RoomsPage.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI

struct RoomsPage: View {
    @ObservedObject var model: RoomsViewModel = RoomsViewModel()
    @ObservedObject var coordinator: RoomsCoordinator = RoomsCoordinator()
    @State var openReservation: Bool = false
    @Binding var path: NavigationPath
    @State var idRoom: Int = 1
    var body: some View {
        
        NavigationStack(path: $path, root: {
            
            VStack(content: {
                ScrollView(.vertical) {
                    ForEach((Array(model.rooms?.rooms ?? [])), id: \.self) { room in
                        
                        RoomCell(room: room, openReservation: $openReservation, idRoom: $idRoom)
                    }
                    .navigationDestination(isPresented: $openReservation, destination: {
//                        $coordinator.openReservationPage(path: $path)
                            ReservationPage()
                    })
                    
                }
                .scrollBounceBehavior(.basedOnSize)
                .navigationTitle("Steigenberger Makadi")
                .font(MyFonts.sfProDisplay_Medium(with: 22))
                .navigationBarTitleDisplayMode(.inline)
                .background(.specialBackground)
            })
        })
        .onAppear(perform: {
            model.getRomms()
        })
                        
    }
}

#Preview {
    RoomsPage(path: .constant(NavigationPath()))
}
