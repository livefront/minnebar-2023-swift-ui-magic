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
                        ForEach(Talk.list) { talk in
                            TalkView(title: talk.title, date: talk.date) {
                                Image(talk.imageName)
                                    .resizable()
                                    .imageScale(.large)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(.gray, lineWidth: 1)
                                    )
                                    .matchedGeometryEffect(id: talk.imageName, in: namespace)
                                    .frame(width: smallImageSize, height: smallImageSize)
                            }
                            .onTapGesture {
                                tapTalk(talk)
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

    func tapTalk(_ talk: Talk?) {
        withAnimation(.easeInOut(duration: 0.3)) { self.selectedTalk = talk }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TalksScreen()
        }
    }
}
