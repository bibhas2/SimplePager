//
//  FullScreenPageViewController.swift
//  BGEiOSApp
//
//  Created by Bibhas Bhattacharya on 10/1/15.
//  Copyright © 2015 Bibhas Bhattacharya. All rights reserved.
//

import UIKit

class FullScreenPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var allChildControllers : [UIViewController]
    
    init(childControllers : [UIViewController]) {
        allChildControllers = childControllers;
        
        super.init(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: Optional.None);
        
        self.setViewControllers([childControllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: Optional.None)
        
        self.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     * Expand the scroll view to take up all the space.
     * Also bring the pager control to the front.
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let subViews: NSArray = view.subviews
        var scrollView: UIScrollView? = nil
        var pageControl: UIPageControl? = nil
        
        for view in subViews {
            if view.isKindOfClass(UIScrollView) {
                scrollView = view as? UIScrollView
            }
            else if view.isKindOfClass(UIPageControl) {
                pageControl = view as? UIPageControl
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            scrollView?.frame = view.bounds
            view.bringSubviewToFront(pageControl!)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        for (index, ctrl) in allChildControllers.enumerate() {
            if ctrl == viewController {
                if index < allChildControllers.count - 1 {
                    return allChildControllers[index + 1]
                }
                
                break
            }
        }

        return Optional.None
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        for (index, ctrl) in allChildControllers.enumerate() {
            if ctrl == viewController {
                if index > 0 {
                    return allChildControllers[index - 1]
                }
                
                break
            }
        }

        return Optional.None
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return allChildControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return Int(0)
    }
}
