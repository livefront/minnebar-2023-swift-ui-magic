import SwiftUI

extension View {
    func secFR1<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .global,
        reader: @escaping (CGRect) -> Void
    ) -> some View where K: FramePreferenceKey {
        backgroundWithFrame(from: key, in: coordinateSpace) { frame in
            // Using preferences in this way is a hack to allow calling a closure when layout
            // changes.
            Color.clear
                .preference(key: CGRectPreferenceKey.self, value: frame)
                .onPreferenceChange(CGRectPreferenceKey.self) { frame in
                    reader(frame)
                }
        }
    }

    func secFR2<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .global,
        into binding: Binding<CGRect>
    ) -> some View where K: FramePreferenceKey {
        secFR1(from: key, in: coordinateSpace) { frame in
            binding.wrappedValue = frame
        }
    }
}

private struct ReadFramePreferenceKey: FramePreferenceKey {}

/// A preference key used only internally by the `readFrame(from:in:reader:)` function.
private struct CGRectPreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

