import SwiftUI

struct ListScreen: View {

    /// `true` if the footer should be stuck to the bottom of the screen.
    var isFooterStuckToBottom: Bool {
        scrollingFooterFrame.minY < stuckToBottomFooterFrame.minY
    }

    @Environment(\.videosMoreContent) var moreContent

    /// The frame of the scrollable footer view.
    @State var scrollingFooterFrame: CGRect = .zero

    /// The frame of the non-scrollable footer view.
    @State var stuckToBottomFooterFrame: CGRect = .zero

    @Namespace var namespace
    @State var selectedTalk: Talk? = nil

    var body: some View {
        ZStack(alignment: .bottom) {
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
                ScrollView {
                    VStack(spacing: 0) {
                        HeaderContentView()
                        VStack(spacing: 0) {
                            ForEach(Talk.longList) { talk in
                                VideoSummaryView(namespace: namespace, talk: talk)
                                    .onTapGesture {
                                        tapTalk(talk)
                                    }
                            }
                        }
                        .writeFrame(to: VideosViewFramePreferenceKey.self)
                        FooterView()
                            .readFrame($scrollingFooterFrame)
                            .opacity(isFooterStuckToBottom ? 0 : 1)
                    }
                }
                FooterView()
                    .readFrame($stuckToBottomFooterFrame)
                    .opacity(isFooterStuckToBottom ? 1 : 0)
            }
        }
    }

    func tapTalk(_ talk: Talk?) {
        withAnimation(.easeInOut(duration: 0.3)) { self.selectedTalk = talk }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListScreen()
        }
    }
}
