//
//  TourstField.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 10/01/24.
//

import SwiftUI

struct TourstField: View {
    @Binding var tourist: Tourist
    @State var deleteMe: Bool
    @Binding var decreaseCount: Int
    @Binding var expandMe: Bool
    @Binding var allFill: Bool
    @Binding var sendBtn: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {

            TouristFieldCell(text: $tourist.fieldName, nameField: $tourist.name, fillField: $tourist.fieldName, sendBtn: $sendBtn)
            
            TouristFieldCell(text: $tourist.fieldSurname, nameField: $tourist.surname, fillField: $tourist.fieldSurname, sendBtn: $sendBtn)
            
            TouristFieldCell(text: $tourist.fieldDateOfBirth, nameField: $tourist.dateOfBirth, fillField: $tourist.fieldDateOfBirth, sendBtn: $sendBtn)
            
            TouristFieldCell(text: $tourist.fieldCitizenship, nameField: $tourist.citizenship, fillField: $tourist.fieldCitizenship, sendBtn: $sendBtn)
            
            TouristFieldCell(text: $tourist.fieldPassport, nameField: $tourist.passport, fillField: $tourist.fieldPassport, sendBtn: $sendBtn)
            
            TouristFieldCell(text: $tourist.fieldExparedDatePassort, nameField: $tourist.exparedDatePassort, fillField: $tourist.fieldExparedDatePassort, sendBtn: $sendBtn)
            
            if deleteMe == false {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Убрать туриста")
                            .font(MyFonts.sfProDisplay_Medium(with: 22))
                            .foregroundStyle(.specialBlue)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(.specialBlue.opacity(0.3))
                .cornerRadius(10)
                .padding(.top, 10)
                .onTapGesture(perform: {
                    if decreaseCount > 1 {
                        decreaseCount -= 1
                        expandMe = false
                    }
                })
            }
               
        }
        .onChange(of: tourist) { _ in
            checkFields()
        }
    }
    func checkFields() {
        if tourist.fieldName.isEmpty || tourist.fieldSurname.isEmpty || tourist.fieldPassport.isEmpty || tourist.fieldCitizenship.isEmpty || tourist.fieldDateOfBirth.isEmpty || tourist.fieldExparedDatePassort.isEmpty {
            allFill = false
        } else {
            allFill = true
        }
    }
}

#Preview {
    TourstField(tourist: .constant( Tourist(id: 0, fieldName: "123", fieldSurname: "123", fieldDateOfBirth: "123", fieldCitizenship: "123", fieldPassport: "123", fieldExparedDatePassort: "123")), deleteMe: false, decreaseCount: .constant(3), expandMe: .constant(true), allFill: .constant(false), sendBtn: .constant(true))
}
