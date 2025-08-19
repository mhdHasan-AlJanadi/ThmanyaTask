//
//  Theme.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import SwiftUI

class ThemeApp{
    static var shared = ThemeApp()
    
    private init(){}
    
    static var fonts  = AppFont()
    
    static var colors = SwiftUIColor()
    
    enum IBMPlexSansFont: String{
        case normal     = "IBMPlexSansArabic"
        case thin       = "IBMPlexSansArabic-Thin"
        case extraLight = "IBMPlexSansArabic-ExtraLight"
        case light      = "IBMPlexSansArabic-Light"
        case text       = "IBMPlexSansArabic-Text"
        case medium     = "IBMPlexSansArabic-Medium"
        case semiBold   = "IBMPlexSansArabic-SemiBold"
        case bold       = "IBMPlexSansArabic-Bold"
    }
    
    
    struct AppFont{
        
        
        var medium14 = giveFont(.medium, size: 14)
        var medium10 = giveFont(.medium, size: 10)
        var bold16 = giveFont(.bold, size: 16)
        var bold18 = giveFont(.bold, size: 18)
        
        
        static private func giveFont(_ type: IBMPlexSansFont, size: CGFloat) -> Font{
            Font.custom(type.rawValue, size: size)
        }
    }
    
    class SwiftUIColor {
        var boldTitle    = Color(hex: "#000000")
        var overImageTitle = Color(hex: "#FFFFFF")
        var queueBackground = Color(hex: "#1D1E29")
        
    }
}
