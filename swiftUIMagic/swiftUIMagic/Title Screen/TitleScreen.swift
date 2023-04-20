import SwiftUI

struct TitleScreen: View {
    var body: some View {
        VerticalRatioLayout(ratio: 0.66) {
            BubblesView()
            BlueBackground()
            ShortText()
        }
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
