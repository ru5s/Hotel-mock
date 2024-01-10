//
//  PaidPage.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 07/01/24.
//

import SwiftUI

struct PaidPage: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }, label: {
                Text("Супер")
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        .padding()
    }
}

#Preview {
    PaidPage()
}
