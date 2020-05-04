# Drawer

`Drawer` helps you create a draggable View Controller.

What does `Draggable` mean in this context?.
`Draggable`: The presented view will have ability to be vertically dragged across the screen. You will be able to use the pan gestures to move the presented view through different draggable states.

The presented View is going to have three draggable or sticky states
  - open
  - mid
  - collapsed
  
This sort of UI is specially useful when you would like to create a reactive app where changes in a modally presented view are reflected in the presenting view.

|Open|Mid|Collapsed|
|---|---|---|
|![Simulator Screen Shot - iPhone 11 Pro - 2020-04-30 at 17 29 01](https://user-images.githubusercontent.com/8016341/80722780-6f358880-8b08-11ea-8857-50736af27f77.png)|![Simulator Screen Shot - iPhone 11 Pro - 2020-04-30 at 17 29 32](https://user-images.githubusercontent.com/8016341/80722787-7066b580-8b08-11ea-972d-328c5c190920.png)|![Simulator Screen Shot - iPhone 11 Pro - 2020-04-30 at 17 29 39](https://user-images.githubusercontent.com/8016341/80722788-70ff4c00-8b08-11ea-89db-c428d0890156.png)|

|Open|Mid|Collapsed|
|---|---|---|
|![Simulator Screen Shot - iPhone 11 Pro - 2020-04-30 at 17 30 12](https://user-images.githubusercontent.com/8016341/80722790-7197e280-8b08-11ea-90ab-f30fcff6e6fb.png)|![Simulator Screen Shot - iPhone 11 Pro - 2020-04-30 at 17 30 16](https://user-images.githubusercontent.com/8016341/80722791-72307900-8b08-11ea-872a-3a2292ded075.png)|![Simulator Screen Shot - iPhone 11 Pro - 2020-04-30 at 17 30 22](https://user-images.githubusercontent.com/8016341/80722792-72c90f80-8b08-11ea-97c4-3270efd12d80.png)|

Setup

In the initializer of the view controller add the following

```
init() {
        super.init(nibName: .none, bundle: .none)
        transitioningDelegate = self
        modalPresentationStyle = .custom
    }
```

Make your view controller conform to `UIViewControllerTransitioningDelegate` 

```
extension SelectCurrencyViewController: UIViewControllerTransitioningDelegate {
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?, source: UIViewController
    ) -> UIPresentationController? {
        DraggablePresentationController(
            presentedViewController: presented,
            presenting: source
        )
    }
}
```

Make sure your view controller conforms to `KeyboardDismissableDraggableView`

```
extension YourViewController: KeyboardDismissableDraggableView {
    var scrollView: UIScrollView {
        tableView
    }
         
    func handleInteraction(enabled: Bool) {
         tableView.isUserInteractionEnabled = enabled
    }
    
    func dismissKeyboard() {
        // It gives you a opportunity to dismiss the keyboard 
        // if the keyboard is presented on the screen
        // When the view is dragged down from `open` state to `mid`
        // state, we would like to dismiss the keyboard
        // Eg ⬇️
        guard searchBar.isFirstResponder else { return }
        searchBar.resignFirstResponder()
    }
}
```

Note: `handleInteraction(enabled: Bool)` is called everytime the the drawer changes it state changes from
`open` to `mid`
`mid` to `open`
`mid` to `collapsed`
`collapsed` to `mid`

It's important that you disable your scroll view when `enable` has `false` value
You can simply acheive this simply doing 
`yourScrollView.isUserInteractionEnabled` = `enabled`

Look at the example above or reach out for help 🙂
