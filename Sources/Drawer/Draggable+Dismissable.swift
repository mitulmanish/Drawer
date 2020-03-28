import UIKit

public typealias KeyboardDismissableDraggableView = KeyboardDismissable & DraggableViewType

public protocol DraggableViewType: AnyObject {
    var scrollView: UIScrollView { get }
    func handleInteraction(enabled: Bool)
}

public protocol KeyboardDismissable: AnyObject {
    func dismissKeyboard()
}
