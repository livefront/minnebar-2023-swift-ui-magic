import SwiftUI

enum ScreenType: Equatable, Hashable {
    case splash
    case list
    case detail(Namespace.ID, Talk)
}
