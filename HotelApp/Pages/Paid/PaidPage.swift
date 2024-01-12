//
//  PaidPage.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI

struct PaidPage: View {
    @State var toHotelPage: Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, content: {
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Image(.partyPopper)
                        .padding(30)
                        .background(.specialBackground)
                        .clipShape(Circle())
                    Text("Ваш заказ принят в работу")
                        .font(MyFonts.sfProDisplay_Medium(with: 22))
                        .padding(10)
                    Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                        .font(MyFonts.sfProDisplay_Medium(with: 16))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
                VStack {
                    Rectangle()
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.gray.opacity(0.5))
                    Button(action: {
                        toHotelPage = true
                    }, label: {
                        Text("Супер")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })
                    .padding(15)
                    .navigationDestination(isPresented: $toHotelPage) {
                        HotelPage(coordinator: HotelCoordinator())
                    }
                }
                .navigationTitle("Заказ оплачен")
                .navigationBarTitleDisplayMode(.inline)
            })
        }
    }
}

#Preview {
    PaidPage()
}
