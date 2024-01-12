//
//  ReservationPage.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI
import iPhoneNumberField

struct ReservationPage: View {
    
    @State var enterNum: String = "+7 "
    @State var enterMail: String = ""
    @StateObject var model: ReservationViewModel = ReservationViewModel()
    @State var countOfTourist: Int = 1
    @State var isFirstGroupExpanded: Bool = true
    @State var sendBtn: Bool = false
    @State var allFill: Bool = false
    @State var showAlert: Bool = false
    @State var openPayedPage: Bool = false
    @State var formattedNum: String = ""
    @State var notFormatted: Bool = true
    @State var validEmail: Bool = false
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
                                    .foregroundStyle(notFormatted && sendBtn ? .error : .gray)
                                if notFormatted {
                                    TextField("+7 (000) 000-00-00", text: $enterNum)
                                        .font(MyFonts.sfProDisplay_Medium(with: 16))
                                        .keyboardType(.phonePad)
                                        .onChange(of: enterNum) {newValue in
                                            if enterNum.count == 13 {
                                                formattedNum = model.formatPhoneNumber(digits: newValue) ?? ""
                                                notFormatted = false
                                            }
                                        }
                                } else {
                                    TextField("", text: $formattedNum)
                                        .font(MyFonts.sfProDisplay_Medium(with: 16))
                                        .keyboardType(.phonePad)
                                        .onChange(of: formattedNum) {newValue in
                                            if formattedNum.count < 20 {
                                                enterNum.removeLast()
                                                notFormatted = true
                                            }
                                        }
                                }
                                
                                
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(.specialBackground)
                        .cornerRadius(10)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Почта")
                                    .font(MyFonts.sfProDisplay_Medium(with: 12))
                                    .foregroundStyle(!validEmail && sendBtn ? .error : .gray)
                                TextField("example@mail.ru".description, text: $enterMail)
                                    .font(MyFonts.sfProDisplay_Medium(with: 16))
                                    .keyboardType(.emailAddress)
                                    .onChange(of: enterMail) {newValue in
                                        validEmail = isValidEmail(newValue)
                                    }
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
                    
                    VStack(alignment: .leading) {
                        ForEach(0..<countOfTourist, id: \.self) { index in
                            ZStack(alignment: .topTrailing) {
                                DisclosureGroup(isExpanded: $model.tourists[index].expandMe) {
                                    TourstField(tourist: $model.tourists[index], deleteMe: model.tourists[index].deleteMe, decreaseCount: $countOfTourist, expandMe: $model.tourists[index].expandMe, allFill: $allFill, sendBtn: $sendBtn)
                                } label: {
                                    HStack {
                                        Text(model.numbersValues[index].rawValue)
                                            .foregroundStyle(.black)
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.bottom, 10)
                                    
                                }
                                .padding([.horizontal, .vertical], 15)
                                .background(.white)
                                .cornerRadius(15)
                                .tint(.clear)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.specialBlue.opacity(0.1))
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .overlay {
                                        Text("\(model.tourists[index].expandMe ? Image(systemName: "chevron.up") : Image(systemName: "chevron.down"))")
                                            .font(MyFonts.sfProDisplay_Medium(with: 16))
                                            .frame(alignment: .center)
                                            .foregroundStyle(.blue)
                                    }
                                    .padding(15)
                                    .allowsHitTesting(false)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Button {
                            if countOfTourist != model.numbersValues.count {
                                countOfTourist += 1
                                model.addTourist(index: countOfTourist)
                            }
                        } label: {
                            HStack {
                                Text("Добавить туриста")
                                    .font(MyFonts.sfProDisplay_Medium(with: 22))
                                Spacer()
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(.blue)
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .overlay {
                                        Text("\(Image(systemName: "plus"))")
                                            .font(MyFonts.sfProDisplay_Medium(with: 16))
                                            .frame(alignment: .center)
                                            .foregroundStyle(.white)
                                    }
                            }
                        }
                        .accentColor(.black)
                    }
                    .padding([.horizontal, .vertical], 15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading) {
                        SummaryFields(name: model.payInfo.tour, count: $model.payInfo.tourPrice)
                        SummaryFields(name: model.payInfo.fuel, count: $model.payInfo.fuelCharge)
                        SummaryFields(name: model.payInfo.service, count: $model.payInfo.serviceCharge)
                        SummaryFields(name: model.payInfo.summary, count: $model.payInfo.summaryCount)
                        
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
                        sendBtn = true
                        if allFill && !notFormatted && validEmail {
                            openPayedPage = true
                        } else {
                            showAlert = true
                        }
                    }, label: {
                        Text("Оплатить")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(allFill ? .blue : .gray)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })
                    
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
                model.removeTourist(index: countOfTourist)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Ошибка"), message: Text("Заполните все поля"), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $openPayedPage) {
                PaidPage()
            }
        }
    }
    func isValidEmail(_ email: String) -> Bool {
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
            return emailPredicate.evaluate(with: email)
        }
}

#Preview {
    ReservationPage()
}
