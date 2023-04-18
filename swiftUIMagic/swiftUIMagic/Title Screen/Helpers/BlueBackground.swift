import SwiftUI

struct BlueBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.clear, .accentColor], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)).opacity(0.5)
            Rectangle()
                .fill(Material.ultraThin)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        BlueBackground()
    }
}
