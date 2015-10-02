# Full Screen Page View Controller

A simplified way to create a full screen page view controller. With the ``FullScreenPageViewController`` class you don't need to implement ``UIPageViewControllerDataSource``.

##Usage
Add the ``FullScreenPageViewController`` to your project. Sample code to show the page view controller:

```swift
//Create the child view controllers
let vc1 = storyboard!.instantiateViewControllerWithIdentifier("PageOneViewController")
let vc2 = storyboard!.instantiateViewControllerWithIdentifier("PageTwoViewController")

//Create the page view controller
self.pageViewController = FullScreenPageViewController(childControllers: [vc1, vc2])

//Show the page view controller
self.view.addSubview(self.pageViewController.view)
```
