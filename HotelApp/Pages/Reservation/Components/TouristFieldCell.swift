//
//  TouristFieldCell.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 11/01/24.
//

import SwiftUI

private enum Focused: Int, Hashable {
    case textField
}

struct TouristFieldCell: View {
    @Binding var text: String
    @Binding var nameField: String
    @Binding var fillField: String
    @FocusState private var touched: Focused?
    @State var bool: Bool = true
    @Binding var sendBtn: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                if bool == true && fillField.isEmpty {
                    Text(nameField)
                        .font(MyFonts.sfProDisplay_Medium(with: 18))
                        .foregroundStyle(sendBtn && fillField.isEmpty ? .error : .gray)
                } else {
                    Text(nameField)
                        .font(MyFonts.sfProDisplay_Medium(with: 12))
                        .foregroundStyle(sendBtn && fillField.isEmpty ? .error : .gray)
                    TextField(fillField, text: $text )
                        .font(MyFonts.sfProDisplay_Medium(with: 16))
                        .keyboardType(.alphabet)
                        .focused($touched, equals: .textField)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 40)
        .padding(10)
        .background(.specialBackground)
        .cornerRadius(10)
        .onTapGesture {
            bool = false
            touched = .textField
        }
    }
}

#Preview {
    TouristFieldCell(text: .constant("123"), nameField: .constant("Имя"), fillField: .constant("123"), sendBtn: .constant(true))
}
