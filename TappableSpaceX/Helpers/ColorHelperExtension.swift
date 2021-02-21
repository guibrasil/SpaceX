//
//  ColorHelperExtension.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 21/02/2021.
//

import Foundation
import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }

    // App Static Colors Theme
    static let backgroundColor = Color.rgb(r: 228, g: 223, b: 218)
}
