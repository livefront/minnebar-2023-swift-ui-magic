import SwiftUI
import UIKit

struct MainView: View {

    init() {
        let titleColor: UIColor = UIColor(named: "navy-blue")!

        let largeAppearance = UINavigationBarAppearance()
        largeAppearance.configureWithTransparentBackground()
        largeAppearance.titleTextAttributes = [.foregroundColor: titleColor]

        let largeSerifTitleDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle).withDesign(.serif)!
        let serifFont = UIFont(descriptor: largeSerifTitleDescriptor, size: 40).bold

        largeAppearance.largeTitleTextAttributes = [
            .foregroundColor: titleColor,
            .font: serifFont
        ]

        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.configureWithDefaultBackground()
        compactAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        compactAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]

        UINavigationBar.appearance().standardAppearance = compactAppearance
        UINavigationBar.appearance().compactAppearance = compactAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = largeAppearance

        UINavigationBar.appearance().tintColor = titleColor
    }

    var body: some View {
        NavigationStack {
            ContentView()
                .navigationTitle("Livefront Talks")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semibold: UIFont { return withWeight(.semibold) }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

        traits[.weight] = weight

        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName

        let descriptor = UIFontDescriptor(fontAttributes: attributes)

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
