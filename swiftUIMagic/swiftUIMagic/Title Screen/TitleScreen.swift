import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack(alignment: .center) {
            // Step 1: Implement the bubbles view and add it to the title screen.
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
