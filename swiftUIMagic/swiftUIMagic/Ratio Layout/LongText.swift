import SwiftUI

struct LongText: View {
    var body: some View {
        NavigationLink(value: ScreenType.list) {
            Text("Hello, Livefront! This is a lot of text that may wrap to many lines and get very large. We want it to be vertically centered at the designated location proportional to the container view. THE END")
                .font(.title)
                .background(Color.black.opacity(0.5))
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
        }
    }
}

struct LongText_Previews: PreviewProvider {
    static var previews: some View {
        LongText()
    }
}
