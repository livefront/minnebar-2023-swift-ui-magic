import SwiftUI

struct TalkListView: View {

    let imageSize: CGFloat = 80

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Talk.list) { talk in
                NavigationLink(value: ScreenType.detail(talk)) {
                    VStack {
                        HStack {
                            Image(talk.imageName)
                                .resizable()
                                .imageScale(.large)
                                .frame(width: imageSize, height: imageSize)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(talk.title)
                                    .lineLimit(2)
                                    .font(.title3)
                                    .fontWeight(.black)
                                Text(talk.date)
                                    .font(.body)
                                    .fontWeight(.thin)
                            }
                            .foregroundColor(.primary)
                            .padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.medium)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                        }
                        .fontDesign(.serif)
                        .multilineTextAlignment(.leading)
                        .padding()
                    }
                }
            }
        }
        .writeFrame(to: TalkListViewFramePreferenceKey.self)
    }
}

struct TalkListView_Previews: PreviewProvider {
    static var previews: some View {
        TalkListView()
    }
}

/// Sends the ``TalkListView``'s frame up through preferences.
struct TalkListViewFramePreferenceKey: FramePreferenceKey {}
