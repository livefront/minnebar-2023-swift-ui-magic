import SwiftUI

extension View {
    func bubbleEffect(percent: CGFloat, scaleFactor: Double) -> some View {
        GeometryReader { proxy in
            modifier(BubbleEffect(percent: percent, scaleFactor: scaleFactor, rect: proxy.frame(in: .local)))
        }
    }
}

struct BubbleEffect: GeometryEffect {
    var percent: CGFloat = 1
    let rect: CGRect
    let scale: CGFloat
    let yValue: CGFloat
    private let xStart: CGFloat
    private let xEnd: CGFloat

    var count = 0

    var animatableData: CGFloat {
        get { return percent }
        set { percent = newValue }
    }

    init(percent: CGFloat, scaleFactor: Double, rect: CGRect) {
        self.percent = percent
        self.rect = rect

        yValue = CGFloat.random(in: 0..<rect.maxY)

        scale = 1.0 - ((1.0 - scaleFactor) * 0.3)
        let width = 80 * scale

        let minXStart = rect.width
        let maxXEnd = -rect.width - width

        let jitter = CGFloat.random(in: (-9 * rect.width)...(9 * rect.width))

        let depth: CGFloat = 15 * rect.width * scaleFactor

        xStart = jitter + minXStart + depth
        xEnd = jitter + maxXEnd - depth
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let x = xEnd + ((xStart - xEnd) * percent)
        let sizeTransform = ProjectionTransform(CGAffineTransform(scaleX: scale, y: scale))
        let translation = ProjectionTransform(CGAffineTransform(translationX: x, y: yValue))
        return sizeTransform.concatenating(translation)
    }
}

