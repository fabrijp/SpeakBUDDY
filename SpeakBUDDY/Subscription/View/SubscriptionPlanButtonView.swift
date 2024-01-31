//
//  SubscriptionPlanButtonView.swift
//  SpeakBUDDY
//
//  Created by Alex Fabri on 2024/01/30.
//

import SwiftUI

/// A view that renders a button for initiating the subscription plan process.
///
/// The button is styled to match the application's design, featuring a specific
/// corner radius, bold font, and shadow effect to emphasize its importance. It is
/// intended to draw the user's attention and encourage them to register for a plan.
struct SubscriptionPlanButtonView: View {
    /// The corner radius for the button's rounded edges.
    let radius: CGFloat = 28.66
    
    /// A closure that defines the action to be performed when the button is tapped.
    var showPlan: () -> Void
    
    var body: some View {
        Button(action: {
            // Triggers the action to show subscription plans.
            showPlan()
        }) {
            Text("プランに登録する") // "Register for a plan" in Japanese
                .font(.custom("HiraginoSans-W6", size: 20)) // Custom font for text.
                .foregroundColor(.white)
                .padding(20) // Padding around the text for a larger clickable area.
                .frame(maxWidth: 350) // Maximum button width.
                .lineLimit(1) // Ensures the text is single-lined.
                .background(.buttonPlan) // Background color (from Assets Catalog).
                .cornerRadius(radius) // Applies the corner radius for rounded edges.
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 2) // Shadow for depth.
                .overlay(
                    RoundedRectangle(cornerRadius: radius) // Creates a rounded rectangle overlay.
                        .stroke(.white, lineWidth: 1) // Adds a white stroke to the overlay.
                )
        }
        .padding(.bottom, 10) // Bottom padding.
    }
}

// MARK: - Preview
struct SubscriptionPlanButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionPlanButtonView(showPlan: {}) // Example usage in a preview.
    }
}
