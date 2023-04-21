# 🪄 SwiftUI Magic: Advanced Techniques for Complex Interfaces.
##### by Tyler Johnson & Paul Himes for Minnebar 17 April 22nd 2023

SwiftUI has revolutionized the way developers create user interfaces for Apple’s platforms. Its declarative API makes it fast and simple to build most common UI designs. However, as applications become more complex, developers may find themselves fighting the system to create truly unique and dynamic interfaces.

In this talk, we covered some of the techniques we’ve used in our projects to achieve custom UI designs. We used animation to add whimsy, implemented custom view alignment, created a new layout container, responded dynamically to user interaction, and improved navigation with custom transitions. With these tools you’ll be able to confidently tackle many types of custom interfaces in your SwiftUI apps.

-----

### Bubble Animation
Add whimsy with animated profile bubbles.

![An app title screen with circular profile images floating by like bubbles.](/readmeResources/bubbleAnimation.gif)
#### Notable Files
* [BubblesView.swift](/swiftUIMagic/swiftUIMagic/Title%20Screen/BubblesView.swift)
* [BubbleEffect.swift](/swiftUIMagic/swiftUIMagic/Title%20Screen/BubbleEffect.swift)
* [TitleScreen.swift](/swiftUIMagic/swiftUIMagic/Title%20Screen/TitleScreen.swift)

-----

### Custom Alignment and Layout
Align views to a custom vertical postion.

![An app title screen with the title aligned 2/3 of the way down.](/readmeResources/alignment.png)
#### Notable Files
* [VerticalRatioAlignment.swift](/swiftUIMagic/swiftUIMagic/Title%20Screen/VerticalRatioAlignment.swift)
* [VerticalRatioLayout.swift](/swiftUIMagic/swiftUIMagic/Title%20Screen/VerticalRatioLayout.swift)
* [TitleScreen.swift](/swiftUIMagic/swiftUIMagic/Title%20Screen/TitleScreen.swift)

-----

### Sticky Footer
Read and respond to the frames of SwiftUI Views to create a footer label that sticks to the bottom of the screen.

![A list of talks being scrolled. The footer label is stuck to the bottom but pushed out of the way when the content approaches.](/readmeResources/stickyFooter.gif)
#### Notable Files
* [TalksScreen.swift](/swiftUIMagic/swiftUIMagic/List%20Screen/TalksScreen.swift)
* [View+ReadFrame.swift](/swiftUIMagic/swiftUIMagic/List%20Screen/View+ReadFrame.swift)
* [BackgroundFrameView.swift](/swiftUIMagic/swiftUIMagic/List%20Screen/Examples/BackgroundFrameView.swift)
* [BackgroundFrameReaderView.swift](/swiftUIMagic/swiftUIMagic/List%20Screen/Examples/BackgroundFrameReaderView.swift)

-----

### Custom Transition
Add a custom animated transition when navigating between screens.

![A list of talks with one talk expanding to fill the screen when it is tapped.](/readmeResources/customTransition.gif)
#### Notable Files
* [TalksScreen.swift](/swiftUIMagic/swiftUIMagic/List%20Screen/TalksScreen.swift)
* [DetailScreen.swift](/swiftUIMagic/swiftUIMagic/Detail%20Screen/DetailScreen.swift)

-----

### Other Helpful Links
* GitHub Repo: https://github.com/livefront/minnebar-2023-swift-ui-magic
* matchedGeometryEffect: https://developer.apple.com/documentation/swiftui/view/matchedgeometryeffect(id:in:properties:anchor:issource:)
* GeometryEffect: https://developer.apple.com/documentation/swiftui/geometryeffect/
* GeometryReader: https://developer.apple.com/documentation/swiftui/geometryreader/
* Advanced SwiftUI Animations:
  * https://swiftui-lab.com/swiftui-animations-part2/
  * https://swiftui-lab.com/swiftui-animations-part3/
