import SwiftUI

struct HeaderContentView: View {

    /// The opacity of the view.
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

/// Stores the opacity of the ``HeaderContentView``.
private struct HeaderOpacityKey: EnvironmentKey {
    static let defaultValue: CGFloat = 1
}

extension EnvironmentValues {
    /// Controls the opacity of the ``HeaderContentView``.
    var headerOpacity: CGFloat {
        get { self[HeaderOpacityKey.self] }
        set { self[HeaderOpacityKey.self] = newValue }
    }
}

/// Sends the ``HeaderContentView``'s frame up through preferences.
struct HeaderViewFrameAnchorPreferenceKey: FramePreferenceKey {}
