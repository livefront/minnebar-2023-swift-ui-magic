import SwiftUI

struct VideoSummaryView: View {

    let imageSize: CGFloat = 80
    let talk: Talk

    var body: some View {
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

struct VideoSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        VideoSummaryView(
            talk: Talk(
                imageName: "tyler-johnson-head-shot",
                title: "Title",
                date: "Date",
                longDescription: "This is a longDescription of the talk."
            )
        )
    }
}
