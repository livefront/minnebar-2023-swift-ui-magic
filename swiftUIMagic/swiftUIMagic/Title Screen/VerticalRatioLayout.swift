import SwiftUI

struct VerticalRatioLayout: Layout {

    let ratio: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = subviews.map { $0.sizeThatFits(proposal).width }.max() ?? 0
        let maxHeight = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0

        return CGSize(
            width: min(proposal.width ?? .infinity, maxWidth),
            height: min(proposal.height ?? .infinity, maxHeight)
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        subviews.forEach { subview in
            let sizeThatFits = subview.sizeThatFits(
                ProposedViewSize(width: bounds.width, height: bounds.height)
            )

            let idealCenter = bounds.height * ratio
            let height = min(sizeThatFits.height, bounds.height)
            let width = min(sizeThatFits.width, bounds.width)
            let halfHeight = height / 2

            let top: CGFloat
            if idealCenter + halfHeight > bounds.height {
                // Move up.
                top = bounds.maxY - height
            } else if idealCenter - halfHeight < 0 {
                // Move down.
                top = bounds.minY
            } else {
                // Don't move.
                top = idealCenter - halfHeight
            }

            subview.place(
                at: CGPoint(x: bounds.origin.x, y: top),
                proposal: ProposedViewSize(width: width, height: height)
            )
        }
    }
}
