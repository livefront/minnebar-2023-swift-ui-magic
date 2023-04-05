import SwiftUI

struct HeaderContentView: View {

    @Environment(\.headerOpacity) var headerOpacity

    var body: some View {
        HStack {
            Text("Livefront Talks")
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .multilineTextAlignment(.leading)
                .padding([.leading], 16)
                .padding([.top], 32)
            Spacer()
        }
        .opacity(headerOpacity)
        .writeFrame(to: HeaderViewFrameAnchorPreferenceKey.self)
    }
}

struct HeaderContentView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderContentView()
    }
}

private struct HeaderOpacityKey: EnvironmentKey {
    static let defaultValue: CGFloat = 1
}

extension EnvironmentValues {
    var headerOpacity: CGFloat {
        get { self[HeaderOpacityKey.self] }
        set { self[HeaderOpacityKey.self] = newValue }
    }
}

struct HeaderViewFrameAnchorPreferenceKey: FramePreferenceKey {}
