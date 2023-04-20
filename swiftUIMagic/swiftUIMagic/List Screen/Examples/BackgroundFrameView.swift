import SwiftUI

struct BackgroundFrameView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
                .writeFrame(to: ExamplePreference.self)
            Spacer()
        }
        .backgroundWithFrame(from: ExamplePreference.self) { frame in
            Color.blue.frame(height: frame.maxY)
        }
    }

    struct ExamplePreference: FramePreferenceKey {}
}

struct BackgroundFrameView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundFrameView()
    }
}
