import SwiftUI

struct ShortText: View {
    var body: some View {
        NavigationLink(value: ScreenType.list) {
            HStack {
                Text("Livefront Talks")
                Image(systemName: "chevron.right")
                    .imageScale(.small)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                Spacer()
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .minimumScaleFactor(0.5)
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .padding()
        }
    }
}

struct ShortText_Previews: PreviewProvider {
    static var previews: some View {
        ShortText()
    }
}
