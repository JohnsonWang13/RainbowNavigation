//
//  LLRainbowNavigationDelegate.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

import UIKit

@objc open class RainbowNavigation: NSObject, UINavigationControllerDelegate {
    
    fileprivate weak var navigationController:UINavigationController?
    
    fileprivate var pushAnimator:RainbowPushAnimator = RainbowPushAnimator()
    fileprivate var popAnimator:RainbowPopAnimator = RainbowPopAnimator()
    fileprivate var dragPop:RainbowDragPop = RainbowDragPop()
    
    override public init() {
        super.init()
        
        dragPop.popAnimator = popAnimator
    }
    
    @objc open func wireTo(_ nc : UINavigationController) {
        self.navigationController = nc
        self.dragPop.navigationController = nc
        self.navigationController?.delegate = self
    }
    
    @objc open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return popAnimator
        }
        return pushAnimator
    }
    @objc open func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return dragPop.interacting ? dragPop : nil
    }
    
}
