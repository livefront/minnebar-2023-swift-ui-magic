import SwiftUI

struct BackgroundFrameReaderView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
            Color.blue.frame(height: 100)
            Spacer()
        }
    }
}

struct BackgroundFrameReaderView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundFrameReaderView()
    }
}
