import SwiftUI

extension View {

    func writeFrame<K>(to key: K.Type) -> some View where K: FramePreferenceKey {
        anchorPreference(
            key: key,
            value: .bounds
        ) { $0 }
    }

    func backgroundWithFrame<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .local,
        @ViewBuilder content: @escaping (CGRect) -> some View
    ) -> some View where K: FramePreferenceKey {
        backgroundPreferenceValue(key) { anchor in
            GeometryReader { proxy in
                let coordinateSpaceFrame = proxy.frame(in: coordinateSpace)
                if let anchor {
                    content(
                        proxy[anchor].offsetBy(
                            dx: coordinateSpaceFrame.origin.x,
                            dy: coordinateSpaceFrame.origin.y
                        )
                    )
                }
            }
        }
    }


}









































protocol FramePreferenceKey: PreferenceKey where Value == Anchor<CGRect>? {}
extension FramePreferenceKey {
    static var defaultValue: Value {
        nil
    }

    static func reduce(value: inout Value, nextValue: () -> Value) {
        let next = nextValue()

        if let next {
            value = next
        }
    }
}












































/// A preference key used only internally by the `readFrame(from:in:reader:)` function.
private struct CGRectPreferenceKey: PreferenceKey {
    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}











































