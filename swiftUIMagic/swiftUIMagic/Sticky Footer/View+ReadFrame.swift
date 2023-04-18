import SwiftUI

extension View {
    func readFrame(reader: @escaping (CGRect) -> Void) -> some View {
        background {
            GeometryReader { geometry in
                Color.clear
                    .preference(key: SimpleFramePreferenceKey.self, value: geometry.frame(in: .global))
                    .onPreferenceChange(SimpleFramePreferenceKey.self) { frame in
                        reader(frame)
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
