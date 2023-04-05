import SwiftUI

struct FooterView: View {

    /// Stores a variable to update a preference for expanding the videos list.
    @State var wantsMoreContent = false

    var body: some View {
        Text("More Talks Coming Soon!")
            .foregroundColor(Color("navy-blue"))
            .font(.title2)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
            .padding()
            .onTapGesture {
                wantsMoreContent = !wantsMoreContent
            }
            .preference(key: VideosWantsMoreContentKey.self, value: wantsMoreContent)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
