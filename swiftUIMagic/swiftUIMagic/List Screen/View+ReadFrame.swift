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
                if let anchor {
                    let localFrame = proxy[anchor]
                    let containerFrame = proxy.frame(in: coordinateSpace)
                    let finalFrame = localFrame.offsetBy(
                        dx: containerFrame.origin.x,
                        dy: containerFrame.origin.y
                    )
                    content(
                        finalFrame
                    )
                }
            }
        }
    }

    func readFrame<K>(
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

    func readFrame<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .global,
        into binding: Binding<CGRect>
    ) -> some View where K: FramePreferenceKey {
        readFrame(from: key, in: coordinateSpace) { frame in
            binding.wrappedValue = frame
        }
    }

    // One-step Read Frame into Binding
    func readFrame(
        in coordinateSpace: CoordinateSpace = .global,
        into binding: Binding<CGRect>
    ) -> some View {
        writeFrame(to: ReadFramePreferenceKey.self)
            .readFrame(from: ReadFramePreferenceKey.self, in: coordinateSpace, into: binding)
    }
}

private struct ReadFramePreferenceKey: FramePreferenceKey {}








































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











































