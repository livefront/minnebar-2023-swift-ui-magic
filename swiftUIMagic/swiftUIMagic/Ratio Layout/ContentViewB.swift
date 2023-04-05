import SwiftUI

struct ContentViewB: View {
    var body: some View {
        VerticalRatioLayout(ratio: 0.66) {
            BlueBackground()
            LongText()
            RedLine()
        }
    }
}

struct ContentViewB_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewB()
    }
}
