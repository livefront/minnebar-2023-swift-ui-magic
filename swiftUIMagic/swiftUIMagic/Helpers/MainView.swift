import SwiftUI
import UIKit

struct MainView: View {
    var body: some View {
        NavigationStack {
            TitleScreen()
                .navigationDestination(for: ScreenType.self) { screenType in
                    switch screenType {
                    case .splash:
                        TitleScreen()
                    case .list:
                        ListScreenDecorator()
                    case .detail(let talk):
                        DetailScreen(talk: talk)
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
