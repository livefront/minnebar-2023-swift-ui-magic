import SwiftUI

struct VideoSummaryView: View {

    let image: Image
    let imageSize: CGFloat = 80
    let title: String
    let description: String

    var body: some View {
        VStack {
            HStack {
                image
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.gray, lineWidth: 1)
                    )
                VStack(alignment: .leading) {
                    Text(title)
                        .lineLimit(2)
                        .font(.title3)
                        .fontWeight(.black)
                    Text(description)
                        .font(.body)
                        .fontWeight(.thin)
                }
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
    static var previews: some View {
        VideoSummaryView(
            image: Image(systemName: "globe"),
            title: "Title",
            description: "Description"
        )
    }
}
