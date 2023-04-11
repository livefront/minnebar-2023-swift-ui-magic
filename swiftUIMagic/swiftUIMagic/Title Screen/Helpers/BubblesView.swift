import SwiftUI

struct BubblesView: View {
    let imageSize: CGFloat = 80
    @State private var percent: CGFloat = 1
    
    var body: some View {
        ForEach(Talk.longList) { talk in
            Image(talk.imageName)
                .resizable()
                .imageScale(.large)
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 1)
                )
                .bubbleEffect(percent: self.percent)
                .onAppear {
                    withAnimation(
                        .linear(duration: 10.0)
                        .repeatForever(autoreverses: false)
                    ) {
                        self.percent = 0
                    }
                }
        }
        .background(.clear)
    }
}

struct BubblesView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesView()
    }
}
