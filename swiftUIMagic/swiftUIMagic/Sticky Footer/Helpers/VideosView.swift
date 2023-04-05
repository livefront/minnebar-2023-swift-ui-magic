import SwiftUI

struct VideosView: View {

    /// `true` if the expanded content list should be shown.
    @Environment(\.videosMoreContent) var moreContent

    var body: some View {
        VStack(spacing: 0) {
            if moreContent {
                VideoSummaryView(
                    image: Image("collin-flynn-head-shot"),
                    title: "Enforce Correctness Through API Design",
                    description: "12/2021"
                )
                VideoSummaryView(
                    image: Image("chris-fry-head-shot"),
                    title: "Gson Deserialization: Three Tips I Wish I Knew",
                    description: "12/2021"
                )
                VideoSummaryView(
                    image: Image("nathan-ansel-head-shot"),
                    title: "How To Be An Expert (At Not Being An Expert)",
                    description: "11/2021"
                )
                VideoSummaryView(
                    image: Image("chris-wodicka-head-shot"),
                    title: "Vestigial Design - Investigating Instagram's Hidden Appendage",
                    description: "11/2021"
                )
                VideoSummaryView(
                    image: Image("tyler-johnson-head-shot"),
                    title: "The Day You Learned Shortcuts",
                    description: "11/2021"
                )
            }
            VideoSummaryView(
                image: Image("megan-pekarek-head-shot"),
                title: "The UX of a Developer",
                description: "11/2021"
            )
            VideoSummaryView(
                image: Image("jack-cunningham-head-shot"),
                title: "How to Transition to the Small Screen",
                description: "11/2021"
            )
            VideoSummaryView(
                image: Image("jennifer-morgan-head-shot"),
                title: "Best Practices When Responding to App Store Reviews",
                description: "11/2021"
            )
        }
        .writeFrame(to: VideosViewFramePreferenceKey.self)
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}

/// Stores the more content flag for ``VideosView``.
private struct VideosMoreContentKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    /// Controls the more content flag of the ``VideosView``.
    var videosMoreContent: Bool {
        get { self[VideosMoreContentKey.self] }
        set { self[VideosMoreContentKey.self] = newValue }
    }
}

/// Sends the ``VideosView``'s frame up through preferences.
struct VideosViewFramePreferenceKey: FramePreferenceKey {}

/// Sends the ``VideosView``'s desire to show more content up through preferences.
struct VideosWantsMoreContentKey: PreferenceKey {
    static var defaultValue = false

    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}
