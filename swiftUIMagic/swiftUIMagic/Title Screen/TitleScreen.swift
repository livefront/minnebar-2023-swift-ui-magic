import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack(alignment: .center) {
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
