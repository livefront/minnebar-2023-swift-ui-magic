import SwiftUI

struct Talk: Equatable, Hashable, Identifiable {
    var id: String {
        title
    }

    let imageName: String
    let title: String
    let date: String
    let longDescription: String

    static let longList = [
        Talk(
            imageName: "collin-flynn-head-shot",
            title: "Enforce Correctness Through API Design",
            date: "12/2021",
            longDescription: "Join Livefront engineer Collin Flynn as he digs into how you can design your API's to help reduce/eliminate invalid state errors!"
        ),
        Talk(
            imageName: "chris-fry-head-shot",
            title: "Gson Deserialization: Three Tips I Wish I Knew",
            date: "12/2021",
            longDescription: "Dive in with Livefront Android engineer Chris Fry as he shares a few helpful tips on how to use Gson deserialization in your code!"
        ),
        Talk(
            imageName: "nathan-ansel-head-shot",
            title: "How To Be An Expert (At Not Being An Expert)",
            date: "11/2021",
            longDescription: "As an engineer you are always learning because technology is always changing! Dive in with Livefront engineer Nathan Ansel as he approaches the topic of learning, and some of the unique benefits of not being an expert."
        ),
        Talk(
            imageName: "chris-wodicka-head-shot",
            title: "Vestigial Design - Investigating Instagram's Hidden Appendage",
            date: "11/2021",
            longDescription: "Sit down with Livefront designer Chris Wodicka as he explores vestigial designs in modern day applications!"
        ),
        Talk(
            imageName: "tyler-johnson-head-shot",
            title: "The Day You Learned Shortcuts",
            date: "11/2021",
            longDescription: "Livefront iOS engineer Tyler Johnson shares a few helpful tips and tricks that he has learned while working with iOS shortcuts."
        ),
    ] + shortList

    static let shortList = [
        Talk(
            imageName: "megan-pekarek-head-shot",
            title: "The UX of a Developer",
            date: "11/2021",
            longDescription: "Livefront engineer Megan Pekarek shares a few thoughts on how you can incorporate UX principles when writing code."
        ),
        Talk(
            imageName: "jack-cunningham-head-shot",
            title: "How to Transition to the Small Screen",
            date: "11/2021",
            longDescription: "Livefront product manager Jack Cunningham dives into the world of TV applications, and shares a few tips on how you can transition to the small screen."
        ),
        Talk(
            imageName: "jennifer-morgan-head-shot",
            title: "Best Practices When Responding to App Store Reviews",
            date: "11/2021",
            longDescription: "Dive in with Livefront product manager Jennifer Lappin as she shares a few best practices around responding to app store reviews!"
        ),
    ]
}
