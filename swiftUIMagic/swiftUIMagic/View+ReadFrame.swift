import SwiftUI

extension View {
    func readFrame(_ binding: Binding<CGRect>) -> some View {
        background {
            GeometryReader { geometry in
                Color.clear
                    .preference(key: FramePreferenceKey.self, value: geometry.frame(in: .global))
                    .onPreferenceChange(FramePreferenceKey.self) { frame in
                        binding.wrappedValue = frame
                    }
            }
        }
    }
}

private struct FramePreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
