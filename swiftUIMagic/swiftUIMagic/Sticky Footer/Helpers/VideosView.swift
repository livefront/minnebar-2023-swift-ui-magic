import SwiftUI

struct VideosView: View {

    /// `true` if the expanded content list should be shown.
    @Environment(\.videosMoreContent) var moreContent

    var body: some View {
        VStack(spacing: 0) {
            ForEach(moreContent ? Talk.longList : Talk.shortList) { talk in
                VideoSummaryView(talk: talk)
            }
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
