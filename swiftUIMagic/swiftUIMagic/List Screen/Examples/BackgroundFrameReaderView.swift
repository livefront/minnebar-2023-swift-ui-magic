import SwiftUI

struct BackgroundFrameReaderView: View {



    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
                .writeFrame(to: ExamplePreference.self)
            Color.blue.frame(height: 100)
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
