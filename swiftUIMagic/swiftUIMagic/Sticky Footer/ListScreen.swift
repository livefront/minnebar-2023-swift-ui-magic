import SwiftUI

struct ListScreen: View {

    /// `true` if the footer should be stuck to the bottom of the screen.
    var isFooterStuckToBottom: Bool {
        scrollingFooterFrame.minY < stuckToBottomFooterFrame.minY
    }

    /// The frame of the scrollable footer view.
    @State var scrollingFooterFrame: CGRect = .zero

    /// The frame of the non-scrollable footer view.
    @State var stuckToBottomFooterFrame: CGRect = .zero

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0) {
                    HeaderContentView()
                    VideosView()
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

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListScreen()
        }
    }
}
