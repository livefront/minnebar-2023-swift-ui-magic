import SwiftUI

struct ShortText: View {
    var body: some View {
        Text("Hello, Livefront!")
            .font(.title)
            .background(Color.black.opacity(0.5))
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
    }
}

struct ShortText_Previews: PreviewProvider {
    static var previews: some View {
        ShortText()
    }
}
