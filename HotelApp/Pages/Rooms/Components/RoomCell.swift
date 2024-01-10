//
//  RoomCell.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 10/01/24.
//

import SwiftUI
import Kingfisher

protocol RoomsDelegate {
    func openPage(path: NavigationPath)
}

struct RoomCell: View {
    @State var room: Room
    @Binding var openReservation: Bool
    @Binding var idRoom: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            TabView {
                ForEach(Array(room.imageUrls.enumerated()), id: \.offset) { index, img in
                    KFImage(URL(string: img))
                        .resizable()
                        .cornerRadius(15)
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 250)
            
            Text(room.name)
                .font(MyFonts.sfProDisplay_Medium(with: 22))
            
            ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack( content: {
                
                    ForEach(room.peculiarities, id: \.self) { count in
                        Text("\(count)")
                            .lineLimit(1)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                            .font(MyFonts.sfProDisplay_Medium(with: 16))
                            .background(.gray.opacity(0.05))
                            .foregroundStyle(.black.opacity(0.65))
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    }
                
            })
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            }
        
            Group {
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .foregroundStyle(.specialBlue.opacity(0.1))
                    .frame(width: 180, height: 29, alignment: .center)
                    .overlay(alignment: .center) {
                        HStack(content: {
                            Button(action: {}, label: {
                                Text("Подробнее о номере \(Image(systemName: "chevron.right"))")
                                    .foregroundStyle(.specialBlue)
                                    .font(MyFonts.sfProDisplay_Regular(with: 16))
                            })
                            
                        })
                        .padding(.horizontal, 3)
                    }
            }
            .padding(.top, 1)
            
            HStack(alignment: .bottom, content: {
                Text("от \(room.price)₽")
                    .font(MyFonts.sfProDisplay_Medium(with: 30))
                Text("\(room.pricePer)")
                    .font(MyFonts.sfProDisplay_Medium(with: 14))
                    .foregroundStyle(Color.gray)
                Spacer()
            })
            .padding(.top, 10)
            
            Button(action: {
                openReservation = true
                
            }, label: {
                Text("Выбрать номер")
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        .padding(15)
        .background(.white)
        .cornerRadius(15)
    }
    
}

#Preview {
    RoomCell(room: .init(id: 1, name: "Стандартный номер с видом на бассейн", price: 186600, pricePer: "За 7 ночей с перелетом", peculiarities: [
        "Включен только завтрак",
        "Кондиционер"],
                         imageUrls: [
        "https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
        "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=",
        "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"
                         ]), openReservation: .constant(false), idRoom: .constant(1))
}
