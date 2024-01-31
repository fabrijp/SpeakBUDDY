//
//  Constants.swift
//  SpeakBUDDY
//
//  Created by Alex Fabri on 2024/01/26.
//

import SwiftUI

/// A utility class containing shared resources and helper functions for the subscription feature.
class SubscriptionHelper {
    
    /// Provides a set of data representing bar chart ratios and titles.
    /// These ratios are mocked based on a maximum height size (300px) defined in Figma design.
    static let barData: [BarData] = [
        BarData(title: "現在", ratio: 0.22),  // "Current" in English
        BarData(title: "3ヶ月", ratio: 0.33), // "3 Months" in English
        BarData(title: "1年", ratio: 0.73),   // "1 Year" in English
        BarData(title: "2年", ratio: 1.0)     // "2 Years" in English
    ]
    
    /// Calculates and returns the screen dimensions of the current device.
    static var screenSizes: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}
