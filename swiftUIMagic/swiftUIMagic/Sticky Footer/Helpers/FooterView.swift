import SwiftUI

struct FooterView: View {
    var body: some View {
        Text("More Talks Coming Soon!")
            .foregroundColor(Color("navy-blue"))
            .font(.title2)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
            .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
