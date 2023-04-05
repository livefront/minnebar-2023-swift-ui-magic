import SwiftUI

extension View {
    /// Adds a background view behind the receiver. The content `ViewBuilder` is given the frame of
    /// a `View` from elsewhere in the view tree which has had its frame written to the given
    /// preference key. The frame may be used to affect the layout or appearance of the new
    /// background `View`. The frame will be in the coordinate space of the receiver, or another
    /// coordinate space if one is supplied.
    ///
    /// This example shows how to define a custom key, use it to get the frame of a view, and use it
    /// again to read that frame from another location in the view tree. When the frame is read, it
    /// will have already been converted to the coordinate space of the other view.
    /// ```
    /// struct MyUniqueKey: FramePreferenceKey {}
    ///
    /// Text("Hello World").writeFrame(to: MyUniqueKey.self)
    ///
    /// Text("Other View")
    ///     .backgroundWithFrame(from: MyUniqueKey.self) { frame in
    ///         Color.red.frame(width: frame.width)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - key: The unique preference key used to write the remote `View`'s frame.
    ///   - coordinateSpace: The coordinate space of the frame. Default is `local` (the receiver's
    ///   coordinate space).
    ///   - content: The background `View` content.
    /// - Returns: The original receiver `View` with an added background view.
    func backgroundWithFrame<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .local,
        @ViewBuilder content: @escaping (CGRect) -> some View
    ) -> some View where K: FramePreferenceKey {
        backgroundPreferenceValue(key) { anchor in
            GeometryReader { proxy in
                let coordinateSpaceFrame = proxy.frame(in: coordinateSpace)
                anchor.map { anchor in
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

    /// Adds a overlay view above the receiver. The content `ViewBuilder` is given the frame of
    /// a `View` from elsewhere in the view tree which has had its frame written to the given
    /// preference key. The frame may be used to affect the layout or appearance of the new
    /// overlay `View`. The frame will be in the coordinate space of the receiver, or another
    /// coordinate space if one is supplied.
    ///
    /// This example shows how to define a custom key, use it to get the frame of a view, and use it
    /// again to read that frame from another location in the view tree. When the frame is read, it
    /// will have already been converted to the coordinate space of the other view.
    /// ```
    /// struct MyUniqueKey: FramePreferenceKey {}
    ///
    /// Text("Hello World").writeFrame(to: MyUniqueKey.self)
    ///
    /// Text("Other View")
    ///     .overlayWithFrame(from: MyUniqueKey.self) { frame in
    ///         Color.red.opacity(0.2).frame(width: frame.width)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - key: The unique preference key used to write the remote `View`'s frame.
    ///   - coordinateSpace: The coordinate space of the frame. Default is `local` (the receiver's
    ///   coordinate space).
    ///   - content: The overlay `View` content.
    /// - Returns: The original receiver `View` with an added overlay view.
    func overlayWithFrame<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .local,
        @ViewBuilder content: @escaping (CGRect) -> some View
    ) -> some View where K: FramePreferenceKey {
        overlayPreferenceValue(key) { anchor in
            GeometryReader { proxy in
                let coordinateSpaceFrame = proxy.frame(in: coordinateSpace)
                anchor.map { anchor in
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

    /// Writes into a binding the frame of a `View` from elsewhere in the view tree which has had
    /// its frame written to the given preference key. The frame will be in the global coordinate
    /// space, or another coordinate space if one is supplied.
    ///
    /// This example shows how to define a custom key, use it to get the frame of a view, and use it
    /// again to read that frame into a binding from another location in the view tree. When the
    /// frame is read, it will have already been converted to global coordinate space.
    /// ```
    /// struct MyUniqueKey: FramePreferenceKey {}
    ///
    /// @State var helloFrame: CGRect?
    ///
    /// Text("Hello World").writeFrame(to: MyUniqueKey.self)
    ///
    /// Text("Other View")
    ///     .readFrame(from: MyUniqueKey.self, binding: $helloFrame)
    /// ```
    ///
    /// - Parameters:
    ///   - key: The unique preference key used to write the remote `View`'s frame.
    ///   - coordinateSpace: The coordinate space of the frame. Default is `global`.
    ///   - binding: The binding which will receive the frame value.
    /// - Returns: The receiving `View`.
    func readFrame<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .global,
        into binding: Binding<CGRect>
    ) -> some View where K: FramePreferenceKey {
        readFrame(from: key, in: coordinateSpace) { frame in
            binding.wrappedValue = frame
        }
    }

    /// Gives the `reader` closure the frame of a `View` from elsewhere in the view tree which has
    /// had its frame written to the given preference key. The frame will be in the global
    /// coordinate space, or another coordinate space if one is supplied.
    ///
    /// This example shows how to define a custom key, use it to get the frame of a view, and use it
    /// again to read that frame from another location in the view tree and pass it to a closure.
    /// When the frame is read, it will have already been converted to global coordinate space.
    /// ```
    /// struct MyUniqueKey: FramePreferenceKey {}
    ///
    /// @State var helloFrame: CGRect?
    ///
    /// Text("Hello World").writeFrame(to: MyUniqueKey.self)
    ///
    /// Text("Other View")
    ///     .readFrame(from: MyUniqueKey.self) { frame in
    ///         print("Frame: \(frame)")
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - key: The unique preference key used to write the remote `View`'s frame.
    ///   - coordinateSpace: The coordinate space of the frame. Default is `global`.
    ///   - reader: A closure to receive the frame value.
    /// - Returns: The receiving `View`.
    func readFrame<K>(
        from key: K.Type,
        in coordinateSpace: CoordinateSpace = .global,
        reader: @escaping (CGRect) -> Void
    ) -> some View where K: FramePreferenceKey {
        backgroundWithFrame(from: key, in: coordinateSpace) { frame in
            // Using preferences in this way is a hack to allow calling a closure when layout
            // changes.
            Color.clear.preference(
                key: CGRectPreferenceKey.self,
                value: frame
            )
            .onPreferenceChange(CGRectPreferenceKey.self) { frame in
                reader(frame)
            }
        }
    }

    /// Gives the `reader` closure the frame of the receiver `View`. The frame will be in the global
    /// coordinate space, or another coordinate space if one is supplied.
    ///
    /// This example shows how to read the frame of a `View` and pass it to a closure. When the
    /// frame is read, it will have already been converted to global coordinate space.
    /// ```
    /// Text("Hello World")
    ///     .readFrame { frame in
    ///         print("Frame: \(frame)")
    ///     }
    /// ```
    /// - Note: This function may incorrectly read `CGRect.zero` in some contexts. You may decide to
    /// ignore values equal to `CGRect.zero` or use a more reliable mechanism such as
    /// `backgroundWithFrame(from:in:content:)` or `overlayWithFrame(from:in:content:)`.
    ///
    /// - Parameters:
    ///   - coordinateSpace: The coordinate space of the frame. Default is `global`.
    ///   - reader: A closure to receive the frame value.
    /// - Returns: The receiving `View`.
    func readFrame(
        in coordinateSpace: CoordinateSpace = .global,
        reader: @escaping (CGRect) -> Void
    ) -> some View {
        writeFrame(to: ReadFramePreferenceKey.self)
            .readFrame(from: ReadFramePreferenceKey.self, in: coordinateSpace, reader: reader)
    }

    /// Writes the frame of the receiving View into the preference for the given key. This key may
    /// then be used to retrieve the frame from another location in the view tree. Each invocation
    /// of the `writeFrame(to:)` function should use its own unique `FramePreferenceKey`. This
    /// prevents frame values from conflicting when they are read by either the
    /// `backgroundWithFrame(from:in:content:)` or `overlayWithFrame(from:in:content:)` functions.
    ///
    /// - Parameter key: A unique preference key.
    /// - Returns: The `View` of the frame being written. You may consider this to be the same as
    /// the original `View`.
    func writeFrame<K>(to key: K.Type) -> some View where K: FramePreferenceKey {
        anchorPreference(
            key: key,
            value: .bounds
        ) { $0 }
    }
}

/// A preference key to report an `Anchor<CGRect>?`. Each invocation of the `writeFrame(to:)`
/// function should use its own unique `FramePreferenceKey`. This prevents frame values from
/// conflicting when they are read by either the `backgroundWithFrame(from:in:content:)` or
/// `overlayWithFrame(from:in:content:)` functions.
///
/// This example shows how to define a custom key, use it to get the frame of a view, and use it
/// again to read that frame from another location in the view tree. When the frame is read, it will
/// have already been converted to the coordinate space of the other view.
/// ```
/// struct MyUniqueKey: FramePreferenceKey {}
///
/// Text("Hello World").writeFrame(to: MyUniqueKey.self)
///
/// Text("Other View")
///     .backgroundWithFrame(from: MyUniqueKey.self) { frame in
///         Color.red.frame(width: frame.width)
///     }
/// ```
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

/// A preference key used only internally by the `readFrame(in:reader:)` function.
private struct ReadFramePreferenceKey: FramePreferenceKey {}
