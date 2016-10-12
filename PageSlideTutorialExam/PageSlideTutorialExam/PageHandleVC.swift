//
//  PageHandleVC.swift
//  PageSlideTutorialExam
//
//  Created by Bogdan Dimitrov Filov on 10/12/16.
//  Copyright © 2016 Bogdan Dimitrov Filov. All rights reserved.
//

import UIKit

class PageHandleVC: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        delegate = self
        
        view.backgroundColor = UIColor.brownColor()
        setViewControllers([getStepOne()], direction: .Forward, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getStepOne() -> TutoVCOne {
        return storyboard!.instantiateViewControllerWithIdentifier("TutoVCOne") as! TutoVCOne
    }
    
    func getStepTwo() -> TutoVCTwo {
        return storyboard!.instantiateViewControllerWithIdentifier("TutoVCTwo") as! TutoVCTwo
    }
    
    func getStepThree() -> TutoVCThree {
        return storyboard!.instantiateViewControllerWithIdentifier("TutoVCThree") as! TutoVCThree
    }
}

// MARK: - UIPageViewControllerDataSource methods
extension PageHandleVC : UIPageViewControllerDataSource {
    
    //Left Slide...
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(TutoVCThree) {
            // 2 -> 1
            return getStepTwo()
        } else if viewController.isKindOfClass(TutoVCTwo) {
            // 1 -> 0
            return getStepOne()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    //Right Slide...
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(TutoVCOne) {
            // 0 -> 1
            return getStepTwo()
        } else if viewController.isKindOfClass(TutoVCTwo) {
            // 1 -> 2
            return getStepThree()
        } else {
            // 2 -> end of the road
            return nil
        }
    }
    
    //dot pagination enables...
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    //This only gets called once, when setViewControllers is called
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

// MARK: - UIPageViewControllerDelegate methods
extension PageHandleVC : UIPageViewControllerDelegate {
    
}
