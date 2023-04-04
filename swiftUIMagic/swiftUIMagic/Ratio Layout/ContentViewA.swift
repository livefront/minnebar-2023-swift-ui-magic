import SwiftUI

struct ContentViewA: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .verticalRatio)) {
            BlueBackground()
            ShortText()
                .alignmentGuide(.verticalRatio) {
                    $0[VerticalAlignment.center]
                }
            RedLine()
                .alignmentGuide(.verticalRatio) {
                    $0[VerticalAlignment.center]
                }
        }
        .foregroundColor(.white)
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA()
    }
}
