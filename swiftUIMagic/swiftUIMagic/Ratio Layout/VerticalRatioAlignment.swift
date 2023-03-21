import SwiftUI

enum VerticalRatioAlignmentId: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height * 0.25
    }
}

extension VerticalAlignment {
    static let verticalRatio = VerticalAlignment(VerticalRatioAlignmentId.self)
}
