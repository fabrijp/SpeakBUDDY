//
//  SubscriptionCloseButtonView.swift
//  SpeakBUDDY
//
//  Created by Alex Fabri on 2024/01/30.
//

import SwiftUI

/// A view component representing a close button for the subscription view.
///
/// This button is designed to be placed at the top-right corner of the view,
/// featuring a circular design with a drop shadow for depth.
struct SubscriptionCloseButtonView: View {
    /// The closure to be executed when the close button is tapped.
    var close: () -> ()
    
    var body: some View {
        HStack {
            Spacer() // Ensures the button aligns to the right.
            Button(action: {
                // Executes the provided closure to handle the close action.
                close()
            }) {
                Circle() // Circular button shape.
                    .fill(.white) // Button color.
                    .frame(width: 38, height: 38) // Fixed size for the button.
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 2) // Drop shadow for depth.
                    .overlay {
                        // The 'x' mark inside the button.
                        Text("x")
                            .font(.custom("HiraginoSans-W7", size: 20)) // Custom font for the 'x' mark.
                            .foregroundColor(.monoBlack) // Color defined in Assets Catalog
                            .frame(width: 14, height: 14) // Ensures the 'x' mark is centered.
                            .lineLimit(1) // Prevents the text from wrapping.
                            .multilineTextAlignment(.center) // Centers the 'x' mark horizontally.
                            .padding(.bottom, 2) // Adjusts the position of the 'x' mark for aesthetic alignment.
                    }
            }
            .padding(.trailing, SubscriptionHelper.screenSizes.width * 0.06) // Right padding relative to screen width.
        }
    }
}

// MARK: - Preview
struct SubscriptionCloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionCloseButtonView {}
    }
}

