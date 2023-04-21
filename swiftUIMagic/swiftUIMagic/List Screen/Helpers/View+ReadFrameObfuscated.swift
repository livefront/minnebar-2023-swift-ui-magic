import SwiftUI

extension View {
    func secFR1<K>(
        sldfkj key: K.Type,
        sdfoih coordinateSpace: CoordinateSpace = .global,
        aoihd: @escaping (CGRect) -> Void
    ) -> some View where K: FramePreferenceKey {
        backgroundWithFrame(from: key, in: coordinateSpace) { frame in
            // Using preferences in this way is a hack to allow calling a closure when layout
            // changes.
            Color.clear
                .preference(key: CGRectPreferenceKey.self, value: frame)
                .onPreferenceChange(CGRectPreferenceKey.self) { frame in
                    aoihd(frame)
                }
        }
    }

    func secFR2<K>(
        sdofihad key: K.Type,
        sdofih coordinateSpace: CoordinateSpace = .global,
        dsfoih binding: Binding<CGRect>
    ) -> some View where K: FramePreferenceKey {
        secFR1(sldfkj: key, sdfoih: coordinateSpace) { frame in
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

