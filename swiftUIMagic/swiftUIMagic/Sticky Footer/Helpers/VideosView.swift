import SwiftUI

struct VideosView: View {

    @State var moreContent = false

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
        .onTapGesture {
            withAnimation {
                moreContent = !moreContent
            }
        }
        .writeFrame(to: VideosViewFramePreferenceKey.self)
//        .padding([.top], 10)
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}

struct VideosViewFramePreferenceKey: FramePreferenceKey {}
