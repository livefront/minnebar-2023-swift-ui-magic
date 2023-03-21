import SwiftUI

struct ShortText: View {
    var body: some View {
        NavigationLink(value: ScreenType.list) {
            HStack {
                Text("Livefront Talks")
                Image(systemName: "chevron.right").imageScale(.small).fontWeight(.bold)
            }
            .font(.title)
            .background(Color.black.opacity(0.5))
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
        }
    }
}

struct ShortText_Previews: PreviewProvider {
    static var previews: some View {
        ShortText()
    }
}
