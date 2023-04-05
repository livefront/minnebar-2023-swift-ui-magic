import SwiftUI

/// Draws a dynamic color curve background shape meant to run up and blend into a curved navigation
/// bar as the user scrolls.
struct ColorCurveBackground: View {

    /// The height of the curve.
    let curveHeight: CGFloat

    /// The number of padding points from the top of the safe area to the beginning of the curve.
    let topPadding: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let curveTop = topPadding + geometry.safeAreaInsets.top
                    let curveBottom = curveTop + curveHeight
                    path.move(to: CGPoint(x: geometry.size.width + 2, y: -1))
                    path.addLine(to: CGPoint(x: -1, y: -1))
                    path.addLine(to: CGPoint(x: -1, y: curveTop))
                    path.addCurve(
                        to: CGPoint(x: geometry.size.width + 2, y: curveTop),
                        control1: CGPoint(x: geometry.size.width * 0.25, y: curveBottom),
                        control2: CGPoint(x: geometry.size.width * 0.75, y: curveBottom)
                    )
                    path.closeSubpath()
                }
                .fill(LinearGradient(colors: [.clear, .accentColor], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)).opacity(0.5))
                Path { path in
                    let curveTop = topPadding + geometry.safeAreaInsets.top
                    let curveBottom = curveTop + curveHeight
                    path.move(to: CGPoint(x: geometry.size.width + 2, y: -1))
                    path.addLine(to: CGPoint(x: -1, y: -1))
                    path.addLine(to: CGPoint(x: -1, y: curveTop))
                    path.addCurve(
                        to: CGPoint(x: geometry.size.width + 2, y: curveTop),
                        control1: CGPoint(x: geometry.size.width * 0.25, y: curveBottom),
                        control2: CGPoint(x: geometry.size.width * 0.75, y: curveBottom)
                    )
                    path.closeSubpath()
                }
                .fill(Material.ultraThin)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ColorCurveBackground_Previews: PreviewProvider {
    static var previews: some View {
        ColorCurveBackground(curveHeight: 8, topPadding: 50)
    }
}
