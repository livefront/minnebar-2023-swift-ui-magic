import SwiftUI

struct TalkView<I: View>: View {

    let title: String
    let date: String
    @ViewBuilder let image: () -> I

    init(title: String, date: String, image: @escaping () -> I) {
        self.title = title
        self.date = date
        self.image = image
    }

    var body: some View {
        VStack {
            HStack {
                image()
                VStack(alignment: .leading) {
                    Text(title)
                        .lineLimit(2)
                        .font(.title3)
                        .fontWeight(.black)
                    Text(date)
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

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView(title: "Title", date: "Date") {
            Image("nathan-ansel-head-shot")
        }
    }
}
