//
//  Extensions.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/17/21.
//

import SwiftUI

extension String {
    static func numberToString(from: Int) -> String {
        let number = Double(from)
        let thousand = (number / 1000)
        let million = number / 1000000
        let billion = number / 1000000000

        if billion >= 1.0 {
            return "\(String(format: "%.1f", billion))B"
        } else if million >= 1.0 {
            return "\(String(format: "%.1f", million))M"
        } else if thousand >= 1.0 {
            return "\(String(format: "%.1f", thousand))K"
        } else {
            return "\(Int(number))"
        }
    }
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
