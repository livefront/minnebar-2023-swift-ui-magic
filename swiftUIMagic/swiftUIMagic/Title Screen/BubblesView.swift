import SwiftUI

struct BubblesView: View {
    let imageSize: CGFloat = 80
    @State private var percent: CGFloat = 0.7

    let talks = Talk.veryLongList

    var body: some View {
        ForEach(Array(talks.enumerated()), id: \.offset) { index, talk in
            Image(talk.imageName)
                .resizable()
                .imageScale(.large)
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 1)
                )
                .blur(radius: blurRadius(index))
                .bubbleEffect(percent: percent, scaleFactor: Double(index) / Double(talks.count))
                .onAppear {
                    withAnimation(
                        .linear(duration: 120.0)
                        .repeatForever(autoreverses: false)
                    ) {
                        self.percent = 0
                    }
                }
        }
        .background(.clear)
    }

    func blurRadius(_ index: Int) -> CGFloat {
        let scaleFactor: Double = min(1.0, (Double(index) / Double(talks.count)) + 0.2)
        return 10 * (1.0 - scaleFactor)
    }
}

struct BubblesView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesView()
    }
}
