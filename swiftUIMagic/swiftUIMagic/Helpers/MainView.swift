import SwiftUI
import UIKit

struct MainView: View {
    var body: some View {
        NavigationStack {
            ContentViewA()
                .navigationDestination(for: ScreenType.self) { screenType in
                    switch screenType {
                    case .splash:
                        ContentViewA()
                    case .list:
                        ListScreenDecorator()
                    }
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
