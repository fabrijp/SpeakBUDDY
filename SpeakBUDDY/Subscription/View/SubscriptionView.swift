//
//  SubscriptionView.swift
//  SpeakBUDDY
//
//  Created by Alex Fabri on 2024/01/30.
//

import SwiftUI

/// A view for managing subscription options, featuring a gradient background,
/// close button, title, graph visualization, and a subscription button.
struct SubscriptionView: View {
    
    /// The background gradient of the view.
    private let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [
            .bgGradientTop,
            .white
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Apply the background gradient to the entire view area, ignoring safe area limits.
                backgroundGradient.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: - Close view button
                    SubscriptionCloseButtonView {
                        // Action to be performed when the close button is tapped.
                        print("Close Button Action")
                    }
                    
                    // MARK: - View title
                    VStack {
                        // Displaying the title text with dynamic font size to accommodate different screen sizes.
                        Text("Hello")
                            .font(.system(size: geometry.size.width * 0.1)) // Adjust font size based on screen width.
                            .fontWeight(.bold)
                            .foregroundColor(.monoBlack) // Custom color defined on Assets catalog.
                            .lineLimit(1) // Ensures the text does not wrap.
                        
                        Text("SpeakBUDDY")
                            .font(.system(size: geometry.size.width * 0.1)) // Similarly, adjust for dynamic sizing.
                            .fontWeight(.bold)
                            .foregroundColor(.monoBlack)
                            .lineLimit(1) // Prevents text wrapping.
                        
                        // MARK: - GraphView & Protty
                        VStack {
                            Spacer() // Provides spacing above the graph.
                            GraphView(geometry: geometry, barData: SubscriptionHelper.barData)
                                .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3) // Adjust graph size dynamically.
                        }
                        
                        // MARK: - Graph complementary texts
                        VStack {
                            Text("スピーカバディで")
                                .font(.custom("HiraginoSans-W6", size: 20))
                                .foregroundColor(.monoBlack)
                                .lineLimit(1) // Prevents text wrapping.
                            
                            // A text view with a gradient background.
                            Text("")
                                .frame(width: 277.9, height: 45) // Dimensions specified as per design.
                                .lineLimit(1)
                                .background(LinearGradient(gradient: Gradient(
                                    colors: [.barGradientTop, .barGradientBottom]),
                                                           startPoint: .bottom,
                                                           endPoint: .top))
                                .mask(Text("レベルアップ")
                                    .lineLimit(1)
                                    .font(.custom("HiraginoSans-W7", size: 30))) // Masking the gradient with text.
                        }
                        .padding(.bottom, geometry.size.height / 40) // Dynamic padding adjustment.
                        
                        // MARK: - Subscription button
                        SubscriptionPlanButtonView {
                            // Action for when the subscription plan button is tapped.
                            print("Show subscription plans")
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
