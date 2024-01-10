//
//  ReservationPage.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI
import iPhoneNumberField

struct ReservationPage: View {
    @State var allFill: Bool = true
    @State var enterText: String = ""
    @State var enterText2: String = "998"
    @ObservedObject var model: ReservationViewModel = ReservationViewModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, content: {
                        Group {
                            HStack(content: {
                                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                    .foregroundStyle(MyColors.lightOrange)
                                    .frame(width: 149, height: 29, alignment: .center)
                                    .overlay(alignment: .center) {
                                        HStack(content: {
                                            Image(.star)
                                            Text("\(model.hotel?.ratingName ?? "")")
                                                .foregroundStyle(.specialOrange)
                                                .font(MyFonts.sfProDisplay_Regular(with: 16))
                                        })
                                        .padding(.horizontal, 3)
                                    }
                                Spacer()
                            })
                            
                            Text("Steigenberger Makadi")
                                .font(MyFonts.sfProDisplay_Medium(with: 22))
                            Text("\(model.hotel?.adress ?? "")")
                                .font(MyFonts.SF_Pro_Display_Bold(with: 14))
                                .foregroundStyle(.specialBlue)
                            
                        }
                        .padding(.top, 1)
                    })
                    .padding([.horizontal, .vertical], 15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading) {
                        ForEach(model.summaryFields, id: \.self) { field in
                            HStack(alignment: .top, content: {
                                Text(field.nameField)
                                    .font(MyFonts.sfProDisplay_Medium(with: 16))
                                    .foregroundStyle(.gray)
                                    .frame(width: 130, alignment: .leading)
                                    
                                Text(field.information)
                                    .font(MyFonts.sfProDisplay_Medium(with: 16))
                                    .frame(alignment: .leading)
                                    Spacer()
                            })
                            .padding(2)
                        }
                        

                    }
                    .padding([.horizontal, .vertical], 15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading) {
                        Text("Информация о покупателе")
                            .font(MyFonts.sfProDisplay_Medium(with: 22))
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Номер телефона")
                                    .font(MyFonts.sfProDisplay_Medium(with: 12))
                                    .foregroundStyle(.gray)
                                TextField("+7(..)..", text: $enterText)
                                    .font(MyFonts.sfProDisplay_Medium(with: 16))
                                    .keyboardType(.phonePad)
                            }
                            
                            
                            Spacer()
                        }
                        
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(.specialBackground)
                        .cornerRadius(10)
                    }
                    .padding([.horizontal, .vertical], 15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(15)
                }
                
                .scrollBounceBehavior(.basedOnSize)
                .font(MyFonts.sfProDisplay_Medium(with: 22))
                .navigationBarTitleDisplayMode(.inline)
                
                VStack(content: {
                    Button(action: {
                        if allFill == true {
                            
                        }
                    }, label: {
                        Text("Оплатить")
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(allFill ? .blue : .gray)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                })
                .padding(10)
                .background(.white)
                .cornerRadius(15)
            }
            .navigationTitle("Бронирование")
            .background(.specialBackground)
            .onAppear {
                model.getReservation()
                model.hotelDataStore()
            }
        }
    }
    private func formatPhoneNumber() -> String {
            let sanitized = enterText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            if let number = Int(sanitized) {
                return formatter.string(from: NSNumber(value: number)) ?? ""
            } else {
                return ""
            }
        }
}

#Preview {
    ReservationPage()
}
