import SwiftUI

enum VerticalRatioAlignmentId: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height * 2/3
    }
}

extension VerticalAlignment {
    static let verticalRatio = VerticalAlignment(VerticalRatioAlignmentId.self)
}
