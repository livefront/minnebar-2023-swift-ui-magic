import SwiftUI

struct BlueBackground: View {
    var body: some View {
        Color(red: 113.0/255.0, green: 197.0/255.0, blue: 232.0/255.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        BlueBackground()
    }
}
