import SwiftUI

struct ContentViewA: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .verticalRatio)) {
            BlueBackground()
            LongText()
//                .alignmentGuide(.verticalRatio) {
//                    $0[VerticalAlignment.center]
//                }
            RedLine()
        }
        .foregroundColor(.white)
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA()
    }
}
