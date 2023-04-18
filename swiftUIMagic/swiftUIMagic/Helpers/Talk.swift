import SwiftUI

struct Talk: Equatable, Hashable, Identifiable {
    var id: String {
        title
    }

    let imageName: String
    let title: String
    let date: String
    let longDescription: String

    static let list = [
        Talk(
            imageName: "jennifer-morgan-head-shot",
            title: "Best Practices When Responding to App Store Reviews",
            date: "11/2021",
            longDescription: "Dive in with Livefront product manager Jennifer Lappin as she shares a few best practices around responding to app store reviews!"
        ),
        Talk(
            imageName: "jack-cunningham-head-shot",
            title: "How to Transition to the Small Screen",
            date: "11/2021",
            longDescription: "Livefront product manager Jack Cunningham dives into the world of TV applications, and shares a few tips on how you can transition to the small screen."
        ),
        Talk(
            imageName: "megan-pekarek-head-shot",
            title: "The UX of a Developer",
            date: "11/2021",
            longDescription: "Livefront engineer Megan Pekarek shares a few thoughts on how you can incorporate UX principles when writing code."
        ),
        Talk(
            imageName: "chris-wodicka-head-shot",
            title: "Vestigial Design - Investigating Instagram's Hidden Appendage",
            date: "11/2021",
            longDescription: "Sit down with Livefront designer Chris Wodicka as he explores vestigial designs in modern day applications!"
        ),
    ]
}

let smallImageSize: CGFloat = 80

