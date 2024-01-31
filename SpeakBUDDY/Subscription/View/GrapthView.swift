//
//  GraphView.swift
//  SpeakBUDDY
//
//  Created by Alex Fabri on 2024/01/30.
//

import SwiftUI

/// Represents data for a single bar in the graph.
struct BarData {
    let title: String
    let ratio: CGFloat
}

/// A view displaying a customizable bar graph with animated bars and a hero image.
struct GraphView: View {
    let geometry: GeometryProxy // Provides access to the parent view's size for responsive layout.
    let barData: [BarData] // Data for each bar in the graph.
    
    @State private var animationProgress: [Bool] // Tracks the animation state of each bar.
    
    /// Initializes the graph view with the necessary geometry and bar data.
    /// - Parameters:
    ///   - geometry: The `GeometryProxy` of the parent view for size calculations.
    ///   - barData: An array of `BarData` representing each bar in the graph.
    init(geometry: GeometryProxy, barData: [BarData]) {
        self.geometry = geometry
        self.barData = barData
        // Initialize all bars' animation state to false.
        self._animationProgress = State(initialValue: Array(repeating: false, count: barData.count))
    }
    
    var body: some View {
        ZStack {
            // MARK: - Bars
            VStack {
                Spacer() // Ensures bars align to the bottom of the available space.
                HStack(alignment: .bottom, spacing: geometry.size.width * 0.05) {
                    ForEach(0..<barData.count, id: \.self) { index in
                        VStack {
                            // Each bar uses a LinearGradient for visual appeal.
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [.barGradientTop, .barGradientBottom]),
                                    startPoint: .bottom,
                                    endPoint: .top))
                            // Dynamic sizing based on the parent view's size and the bar's data ratio.
                                .frame(width: geometry.size.width * 0.13, height: (geometry.size.height * 0.42) * (animationProgress[index] ? barData[index].ratio : 0))
                                .clipShape(RoundedCorner(radius: 3, corners: [.topLeft, .topRight]))
                                .animation(.easeOut(duration: 0.5), value: animationProgress[index])
                            // Display the title for each bar.
                            Text(barData[index].title)
                                .font(.custom("HiraginoSans-W7", size: 12))
                                .foregroundColor(.monoBlack)
                        }
                    }
                }
            }
            
            // MARK: - Hero Image
            VStack {
                HStack {
                    Image("protty") // Hero image, dynamically sized.
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.22)
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.bottom, geometry.size.height / 3.5) // Adjust padding based on screen height.
            }
        }
        .frame(width: geometry.size.width)
        .padding(.bottom, geometry.size.height < 800 ? 200 : 400) // Conditional padding for smaller devices.
        .onAppear {
            // Sequentially animate each bar with a slight delay.
            for index in barData.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                    animationProgress[index] = true
                }
            }
        }
    }
}

/// A custom shape for creating rounded corners on specific corners of a rectangle.
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
