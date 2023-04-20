import SwiftUI

struct ListScreenDecorator: View {

    /// The frame (in screen coordinates) of the scrolling header content.
    @State var scrollViewHeaderContentFrame: CGRect = .zero
    /// The frame (in screen coordinates) of the scroll view.
    @State var scrollViewFrame: CGRect = .zero

    /// Calculates the top padding of the background color curve to control the vertical location of
    /// the bottom curve. The value ranges are designed to cause the background curve to "run up" to
    /// meet the bottom of the navigation bar as the user scrolls the content up.
    var backgroundCurveTopPadding: CGFloat {
        let minPadding: CGFloat = 0
        let maxPadding = scrollViewHeaderContentFrame.maxY - scrollViewHeaderContentFrame.minY + max(0, scrollViewOffset) + scrollViewFrame.height / 10
        let minScroll: CGFloat = -(scrollViewHeaderContentFrame.maxY - scrollViewHeaderContentFrame.minY)
        let maxScroll = max(0, scrollViewOffset)
        return scrollViewOffset
            .map(domain: (maxScroll, minScroll), range: (maxPadding, minPadding))
    }

    /// The opacity of the large header title.
    var headerContentOpacity: CGFloat {
        let minOpacity: CGFloat = 0
        let maxOpacity: CGFloat = 1
        let minScroll: CGFloat = -(scrollViewHeaderContentFrame.maxY - scrollViewHeaderContentFrame.minY) + 20
        let maxScroll = max(0, scrollViewOffset)
        return scrollViewOffset
            .map(domain: (maxScroll, minScroll), range: (maxOpacity, minOpacity))
    }

    /// The curve height of the header background shape.
    let headerCurveHeight: CGFloat = 16

    /// The offset of the scroll view content from the frame of the scroll view.
    var scrollViewOffset: CGFloat {
        return scrollViewHeaderContentFrame.origin.y - scrollViewFrame.origin.y
    }

    /// `true` iff the navigation bar title and settings button should be shown.
    var showNavBarContent: Bool {
        backgroundCurveTopPadding <= 0
    }

    var body: some View {
        ZStack {
            if !showNavBarContent {
                ColorCurveBackground(
                    curveHeight: headerCurveHeight,
                    topPadding: backgroundCurveTopPadding
                )
                .edgesIgnoringSafeArea([.leading, .trailing])
            }
            TalksScreen()
                .environment(\.headerOpacity, headerContentOpacity)
                .writeFrame(to: TalkListScreenFramePreferenceKey.self)
            if showNavBarContent {
                ColorCurveBackground(
                    curveHeight: headerCurveHeight,
                    topPadding: 0 // 0 aligns the top of the curve with the top of the safe area.
                )
                .edgesIgnoringSafeArea([.leading, .trailing])
            }
        }
        .secFR2(from: HeaderViewFrameAnchorPreferenceKey.self, into: $scrollViewHeaderContentFrame)
        .secFR2(from: TalkListScreenFramePreferenceKey.self, into: $scrollViewFrame)
        .toolbar {
            /// Replace the navigation title with an empty view when it should be hidden.
            ToolbarItem(placement: .principal) {
                if headerContentOpacity > 0.1 {
                    Text("")
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationTitle("Livefront Talks")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TalkListScreenDecorator_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListScreenDecorator()
        }
    }
}

/// Sends the ``TalksScreen``'s frame up through preferences.
struct TalkListScreenFramePreferenceKey: FramePreferenceKey {}
