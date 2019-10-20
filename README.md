# SwipeTabViewController
Customizable ViewController for navigation between tabs, which adds child view controllers.

# Usage
-----
Conform `ViewControllerPresentable` protocol by ViewController which you would like to present and set it's title.

```swift
class Test1ViewController: UIViewController, Presentable {
    
    var presentableTitle: String = "VC1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
```
In main ViewController add to array view controllers you would like to present, and build SwipeTabViewController with array you've created. 

```swift
class ExampleViewController: UIViewController {
    let vc1 = Test1ViewController()
    let vc2 = Test2ViewController()
    let vc3 = Test3ViewController()
    let vc4 = Test4ViewController()
    let vc5 = Test5ViewController()
    let vc6 = Test6ViewController()
    var array: [ViewControllerPresentable]!

    var swipeTabViewController: SwipeTabViewController!

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        array = [vc1, vc2, vc3, vc4, vc5, vc6]
        swipeTabViewController = SwipeTabViewController.Builder(viewControllers: array).build()
        activateConstraints()
        addChild(vc: swipeTabViewController, inContainer: container)

    }

    func activateConstraints() {
        view.addSubview(container)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

}
```
# Customization
To customize SwipeTabViewController you should use some of Builder's methods. 
* `set(sectionsBarBackgroundColor: UIColor)` - sets background color of view controller's title bar.
* `set(textColor: UIColor)` - sets text color of view controller's titles on a title bar.
* `set(highlightedTextColor: UIColor)` - sets text color to highlight selected view controller.
* `set(indicatorColor: UIColor)` - sets color to indictator which points on selected view controller.

You can also set titles bar height specifying coefitient, which determines how much space titles bar will take.
```swift

```
