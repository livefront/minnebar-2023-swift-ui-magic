import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack(alignment: .center) {
            BlueBackground()
            // Step 1: Implement the bubbles view and add it to the title screen.
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
