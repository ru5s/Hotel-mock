//
//  HotelPage.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI
import Kingfisher

struct HotelPage: View {
    @ObservedObject var model: HotelViewModel = HotelViewModel()
    @ObservedObject var coordinator: HotelCoordinator
    @State var choosedRoom: Bool = false
//    @State var path: NavigationPath = NavigationPath()
    @State var currentPage: Int = 0
    @State var showAlert: Bool = false
    @State var textAlert: String = ""
    @State var rows = [
        GridItem(.flexible(minimum: 10, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 400))
        ]
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ScrollView(.vertical) {
                Spacer()
                VStack(alignment: .leading) {
                    TabView {
                        if let image = model.hotel?.imageUrls {
                            ForEach(Array(image.enumerated()), id: \.offset) { index, img in
                                KFImage(URL(string: img))
                                    .resizable()
                                    .cornerRadius(15)
                                    .clipped()
                                    .onAppear(perform: {
                                        currentPage = index
                                    })
                                
                            }
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 250)
                    
                    Group {
                        RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                            .foregroundStyle(MyColors.lightOrange)
                            .frame(width: 149, height: 29, alignment: .center)
                            .overlay(alignment: .center) {
                                HStack(content: {
                                    Image(.star)
                                    Text("\(model.hotel?.rating ?? 0) \(model.hotel?.ratingName ?? "")")
                                        .foregroundStyle(.specialOrange)
                                        .font(MyFonts.sfProDisplay_Regular(with: 16))
                                })
                                .padding(.horizontal, 3)
                            }
                        Text("Steigenberger Makadi")
                            .font(MyFonts.sfProDisplay_Medium(with: 22))
                        Text(model.hotel?.adress ?? "")
                            .font(MyFonts.SF_Pro_Display_Bold(with: 14))
                            .foregroundStyle(.specialBlue)
                        
                    }
                    .padding(.top, 1)
                    
                    HStack(alignment: .bottom, content: {
                        Text("от \(model.hotel?.minimalPrice ?? 0) ₽")
                            .font(MyFonts.sfProDisplay_Medium(with: 30))
                        Text(model.hotel?.priceForIt.lowercased() ?? "")
                            .font(MyFonts.sfProDisplay_Medium(with: 14))
                        Spacer()
                    })
                    .padding(.top, 10)
                }
                .padding([.horizontal, .vertical], 15)
                .background(.white)
                .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Steigenberger Makadi")
                            .font(MyFonts.sfProDisplay_Medium(with: 22))
                        Spacer()
                    }
                    
                        
                    HStack(alignment: .bottom, spacing: 5) {
                        LazyVGrid(columns: rows, alignment: .leading, content: {
                            ForEach(model.hotel?.aboutHotel.peculiarities ?? [], id: \.self) { count in
                                Text("\(count)")
                                    .lineLimit(1)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .font(MyFonts.sfProDisplay_Medium(with: 16))
                                    .background(.gray.opacity(0.05))
                                    .foregroundStyle(.black.opacity(0.65))
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                                    .onTapGesture {
                                        textAlert = count
                                        showAlert = true
                                    }
                            }
                        })
                    }
                    
                    Text("\(model.hotel?.aboutHotel.description ?? "")")
                        .font(MyFonts.sfProDisplay_Medium(with: 16))
                        .padding(.vertical, 5)
                    
                    VStack {
                        LazyVStack(alignment: .leading, spacing: 5) {
                            ForEach(model.buttons, id: \.self) { button in
                                Button {
                                    
                                } label: {
                                    VStack {
                                        HStack {
                                            Image(button.icon)
                                            VStack(alignment: .leading) {
                                                Text(button.name)
                                                    .font(MyFonts.sfProDisplay_Medium(with: 16))
                                                Text(button.description)
                                                    .font(MyFonts.sfProDisplay_Medium(with: 14))
                                            }
                                            .foregroundStyle(.black)
                                            Spacer()
                                            Image(systemName: button.arrow)
                                                .scaleEffect(0.7)
                                                .foregroundStyle(.black)
                                        }
                                        Rectangle()
                                            .frame(height: 1)
                                            .padding(5)
                                            .foregroundStyle(.black.opacity(0.2))
                                    }
                                }
                                
                            }
                        }
                    }
                    .padding()
                    .background(.gray.opacity(0.05))
                    .cornerRadius(10)
                }
                .padding([.horizontal, .vertical], 15)
                .background(.white)
                .cornerRadius(15)
                
                Spacer()
                
               
                
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Отель")
            .font(MyFonts.sfProDisplay_Medium(with: 22))
            .navigationBarTitleDisplayMode(.inline)
            .background(.specialBackground)
            
            Spacer()
            
            VStack {
                Button("К выбору номера") {
                    coordinator.path.append(AllPages.room)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
                .navigationDestination(for: AllPages.self) { value in
                    coordinator.openAllPages(type: value, path: $coordinator.path)
                }
            }
            .padding(10)
            .background(.white)
            .cornerRadius(15)
        }
        .padding(0)
        .onAppear(perform: {
            model.getHotel {
                model.sharedHotel()
            }
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Услуга"), message: Text(textAlert), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    HotelPage(coordinator: HotelCoordinator())
}
