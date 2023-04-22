import SwiftUI

struct VerticalRatioLayout: Layout {

    let ratio: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = subviews.map { $0.sizeThatFits(proposal).width }.max() ?? 0
        let maxHeight = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0

        return CGSize(
            width: maxWidth,
            height: maxHeight
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
            let height = min(sizeThatFits.height, bounds.height)
            let width = min(sizeThatFits.width, bounds.width)
            let halfHeight = height / 2

            var center = bounds.minY + bounds.height * ratio

            if center + halfHeight > bounds.maxY {
                // Move up.
                center = bounds.maxY - halfHeight
            } else if center - halfHeight < bounds.minY {
                // Move down.
                center = bounds.minY + halfHeight
            }

            subview.place(
                at: CGPoint(x: bounds.origin.x, y: center),
                anchor: UnitPoint(x: 0, y: 0.5),
                proposal: ProposedViewSize(width: width, height: height)
            )
        }
    }
}
