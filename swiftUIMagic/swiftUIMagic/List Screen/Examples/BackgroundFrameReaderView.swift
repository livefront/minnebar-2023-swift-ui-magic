import SwiftUI

struct BackgroundFrameReaderView: View {

    @State var textFrame: CGRect = .zero

    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
                .readFrame(into: $textFrame)
            Color.blue.frame(height: textFrame.height)
            Spacer()
        }
    }

    struct ExamplePreference: FramePreferenceKey {}
}

struct BackgroundFrameReaderView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundFrameReaderView()
    }
}
