import SwiftUI

struct VideoSummaryView: View {

    let imageSize: CGFloat = 80
    let namespace: Namespace.ID
    let talk: Talk

    var body: some View {
        VStack {
            HStack {
                Image(talk.imageName)
                    .resizable()
                    .imageScale(.large)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.gray, lineWidth: 1)
                    )
                    .matchedGeometryEffect(id: talk.imageName, in: namespace, properties: .frame, isSource: true)
                    .frame(width: imageSize, height: imageSize)
                VStack(alignment: .leading) {
                    Text(talk.title)
                        .matchedGeometryEffect(id: talk.title, in: namespace, properties: .frame, isSource: true)
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

struct VideoSummaryView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        VideoSummaryView(
            namespace: namespace,
            talk: Talk(
                imageName: "tyler-johnson-head-shot",
                title: "Title",
                date: "Date",
                longDescription: "This is a longDescription of the talk."
            )
        )
    }
}
