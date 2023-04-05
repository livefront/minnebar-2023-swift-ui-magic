import SwiftUI

extension View {
    /// Reads the current frame of the view.
    /// - Parameter binding: A binding to receive update frame values.
    /// - Returns: A view with a frame reader attached.
    func readFrame(_ binding: Binding<CGRect>) -> some View {
        background {
            GeometryReader { geometry in
                Color.clear
                    .preference(key: SimpleFramePreferenceKey.self, value: geometry.frame(in: .global))
                    .onPreferenceChange(SimpleFramePreferenceKey.self) { frame in
                        binding.wrappedValue = frame
                    }
            }
        }
    }
}

/// Sends a view's frame through the preferences system.
private struct SimpleFramePreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
