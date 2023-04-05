import SwiftUI

extension View {
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

private struct SimpleFramePreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
