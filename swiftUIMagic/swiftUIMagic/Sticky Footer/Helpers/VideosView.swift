import SwiftUI

struct VideosView: View {

    /// `true` if the expanded content list should be shown.
    @Environment(\.videosMoreContent) var moreContent
    @Namespace var namespace
    @State private var selectedTalk: Talk? = nil

    var body: some View {
        if let talk = selectedTalk {
            DetailScreen(namespace: namespace, talk: talk)
                .navigationBarItems(trailing: HStack {
                    Button(
                        action: { tapTalk(nil) },
                        label: { Text("Done") }
                    )
                })
                .navigationBarBackButtonHidden(true)
        } else {
            VStack(spacing: 0) {
                ForEach(moreContent ? Talk.longList : Talk.shortList) { talk in
                    VideoSummaryView(namespace: namespace, talk: talk)
                        .onTapGesture {
                            tapTalk(talk)
                        }
                }
            }
            .writeFrame(to: VideosViewFramePreferenceKey.self)
        }
    }

    func tapTalk(_ talk: Talk?) {
        withAnimation(.easeInOut(duration: 0.3)) { self.selectedTalk = talk }
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
        set {
            print("videosMoreContent is changing: \(newValue)")
            self[VideosMoreContentKey.self] = newValue
        }
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
