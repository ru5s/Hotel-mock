//
//  SummaryFields.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 11/01/24.
//

import SwiftUI

struct SummaryFields: View {
    @State var name: String
    @Binding var count: Int
    var body: some View {
        HStack(alignment: .top, content: {
            Text(name)
                .font(MyFonts.sfProDisplay_Medium(with: 16))
                .foregroundStyle(.gray)
                .frame(width: 130, alignment: .leading)
            Spacer()
            Text("\(String(count)) ₽")
                .font(MyFonts.sfProDisplay_Medium(with: 16))
                .frame(alignment: .leading)
                
        })
        .padding(2)
    }
}

#Preview {
    SummaryFields(name: "Тур", count: .constant(12000))
}
