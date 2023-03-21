import SwiftUI

struct TalkListScreen: View {

    var isFooterStuckToBottom: Bool {
        scrollingFooterFrame.minY < stuckToBottomFooterFrame.minY
    }
    @State var scrollingFooterFrame: CGRect = .zero
    @State var stuckToBottomFooterFrame: CGRect = .zero

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VideosView()
                FooterView()
                    .readFrame($scrollingFooterFrame)
                    .opacity(isFooterStuckToBottom ? 0 : 1)
            }
            FooterView()
                .readFrame($stuckToBottomFooterFrame)
                .opacity(isFooterStuckToBottom ? 1 : 0)
        }
        .navigationTitle("Livefront Talks")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TalkListScreen()
    }
}
