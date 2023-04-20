import SwiftUI

struct DetailScreen: View {

    let imageSize: CGFloat = 150
    let namespace: Namespace.ID
    let talk: Talk

    var body: some View {
        ZStack {
            ColorCurveBackground(
                curveHeight: 16,
                topPadding: 100
            )
            .edgesIgnoringSafeArea([.leading, .trailing])
            VStack(alignment: .leading, spacing: 24) {
                HStack(alignment: .top) {
                    Image(talk.imageName)
                        .resizable()
                        .imageScale(.large)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.gray, lineWidth: 1)
                        )
                        .matchedGeometryEffect(id: talk.imageName, in: namespace)
                        .frame(width: imageSize, height: imageSize)
                    VStack(alignment: .leading) {
                        Text(talk.title)
                            .font(.title)
                            .fontWeight(.black)
                        Text(talk.date)
                            .font(.body)
                            .fontWeight(.thin)
                    }
                    .foregroundColor(.primary)
                    .fontDesign(.serif)
                    .multilineTextAlignment(.leading)
                    Spacer()
                }
                Text(talk.longDescription)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Image("video")
                    .resizable()
                    .aspectRatio(16.0/10.0, contentMode: .fit)
                    .cornerRadius(16)
                Spacer()
            }
            .padding()
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        DetailScreen(
            namespace: namespace,
            talk: Talk(
                imageName: "tyler-johnson-head-shot",
                title: "Title",
                date: "Date",
                longDescription: "This is a description of the talk."
            )
        )
    }
}
