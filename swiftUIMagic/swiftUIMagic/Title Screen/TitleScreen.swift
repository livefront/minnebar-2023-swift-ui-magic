import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack(alignment: .center) {
            BlueBackground()
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
