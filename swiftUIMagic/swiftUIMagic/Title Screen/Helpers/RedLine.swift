import SwiftUI

struct RedLine: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, maxHeight: 4)
            .alignmentGuide(.verticalRatio) {
                $0[VerticalAlignment.center]
            }
    }
}

struct MarkerLine_Previews: PreviewProvider {
    static var previews: some View {
        RedLine()
    }
}
