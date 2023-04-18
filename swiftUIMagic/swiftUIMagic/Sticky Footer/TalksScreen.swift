import SwiftUI

struct TalksScreen: View {

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
                    ForEach(Talk.list) { talk in
                        NavigationLink(value: ScreenType.detail(talk)) {
                            TalkView(title: talk.title, date: talk.date) {
                                Image(talk.imageName)
                                    .resizable()
                                    .imageScale(.large)
                                    .frame(width: smallImageSize, height: smallImageSize)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(.gray, lineWidth: 1)
                                    )
                            }
                        }
                    }
                    FooterView()
                        .readFrame(into: $scrollingFooterFrame)
                        .opacity(isFooterStuckToBottom ? 0 : 1)
                }
            }
            FooterView()
                .readFrame(into: $stuckToBottomFooterFrame)
                .opacity(isFooterStuckToBottom ? 1 : 0)
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TalksScreen()
        }
    }
}
