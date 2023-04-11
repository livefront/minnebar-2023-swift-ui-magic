import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack(alignment: .center) {
            BlueBackground()
            BubblesView()
            ShortText()
//            RedLine()
        }
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
