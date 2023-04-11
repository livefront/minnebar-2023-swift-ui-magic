import SwiftUI

extension View {
    func bubbleEffect(percent: CGFloat) -> some View {
        GeometryReader { proxy in
            modifier(BubbleEffect(percent: percent, rect: proxy.frame(in: .local)))
        }
    }
}

struct BubbleEffect: GeometryEffect {
    var percent: CGFloat = 1
    let rect: CGRect
    let scale = CGFloat.random(in: 0.25...1)
    let yValue: CGFloat
    private let xStart: CGFloat
    private let xEnd: CGFloat

    var count = 0

    var animatableData: CGFloat {
        get { return percent }
        set { percent = newValue }
    }

    init(percent: CGFloat, rect: CGRect) {
        self.percent = percent
        self.rect = rect
        self.yValue = CGFloat.random(in: 0..<rect.maxY)
        self.xStart = CGFloat.random(in: rect.maxX..<rect.maxX*2)
        self.xEnd = self.xStart - rect.maxX*3
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let x = xEnd + ((xStart - xEnd) * percent)
        // let sizeTransform = ProjectionTransform(CGAffineTransform(scaleX: scale, y: scale))
        return ProjectionTransform(CGAffineTransform(translationX: x, y: yValue))//.concatenating(sizeTransform)
    }
}
