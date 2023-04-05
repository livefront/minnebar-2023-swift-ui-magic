import SwiftUI

struct TalkListScreenDecorator: View {

    @State var scrollViewContentFrame: CGRect = .zero
    @State var scrollViewFrame: CGRect = .zero
    @State var videosViewFrame: CGRect = .zero

    /// Calculates the top padding of the background color curve to control the vertical location of
    /// the bottom curve. The value ranges are designed to cause the background curve to "run up" to
    /// meet the bottom of the navigation bar as the user scrolls the content up.
    var backgroundCurveTopPadding: CGFloat {
        let minPadding: CGFloat = 0
        let maxPadding = videosViewFrame.minY - scrollViewContentFrame.minY + max(0, scrollViewOffset) + scrollViewFrame.height / 10
        let minScroll: CGFloat = -(videosViewFrame.minY - scrollViewContentFrame.minY)
        let maxScroll = max(0, scrollViewOffset)
        return scrollViewOffset
            .map(domain: (maxScroll, minScroll), range: (maxPadding, minPadding))
    }

    /// The opacity of the large header title.
    var headerContentOpacity: CGFloat {
        let minOpacity: CGFloat = 0
        let maxOpacity: CGFloat = 1
        let minScroll: CGFloat = -(videosViewFrame.minY - scrollViewContentFrame.minY) + 20
        let maxScroll = max(0, scrollViewOffset)
        return scrollViewOffset
            .map(domain: (maxScroll, minScroll), range: (maxOpacity, minOpacity))
    }

    /// The color of the header background.
    let headerColor = Color(red: 0.9, green: 0.9, blue: 0.9)

    /// The curve height of the header background shape.
    let headerCurveHeight: CGFloat = 16

    /// The offset of the scroll view content from the frame of the scroll view.
    var scrollViewOffset: CGFloat {
        return scrollViewContentFrame.origin.y - scrollViewFrame.origin.y
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
            }
            TalkListScreen()
                .environment(\.headerOpacity, headerContentOpacity)
                .writeFrame(to: ScrollViewFramePreferenceKey.self)
            if showNavBarContent {
                ColorCurveBackground(
                    curveHeight: headerCurveHeight,
                    topPadding: 0 // 0 aligns the top of the curve with the top of the safe area.
                )
            }
        }
        .readFrame(from: HeaderViewFrameAnchorPreferenceKey.self, into: $scrollViewContentFrame)
        .readFrame(from: ScrollViewFramePreferenceKey.self, into: $scrollViewFrame)
        .readFrame(from: VideosViewFramePreferenceKey.self, into: $videosViewFrame)
        .toolbar {
            /// Replace the navigation title with an empty view when it should be hidden.
            ToolbarItem(placement: .principal) {
                if !showNavBarContent {
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
            TalkListScreenDecorator()
        }
    }
}

struct ScrollViewFramePreferenceKey: FramePreferenceKey {}
