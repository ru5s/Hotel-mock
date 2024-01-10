//
//  Fonts.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 08/01/24.
//

import SwiftUI

enum MyFonts {
    static func sfProDisplay_Medium(with size: CGFloat) -> Font {
        Font.custom("SF Pro Display", size: size)
    }
    
    static func sfProDisplay_Regular(with size: CGFloat) -> Font {
        Font.custom("SF Pro Display", size: size).weight(.regular)
    }
    
    static func SF_Pro_Display_Bold(with size: CGFloat) -> Font {
        Font.custom("SF Pro Display Bold", size: size).weight(.heavy)
    }
}
