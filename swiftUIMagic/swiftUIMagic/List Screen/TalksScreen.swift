import SwiftUI

struct TalksScreen: View {

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
                }
            }
            FooterView()
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
