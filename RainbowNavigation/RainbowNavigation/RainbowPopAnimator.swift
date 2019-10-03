//
//  LLRainbowPopAnimator.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

import UIKit

class RainbowPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var animating = false
    var finishCancel: Bool = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let fromColorSource = fromVC as? RainbowColorSource
        let toColorSource = toVC as? RainbowColorSource
        
        var nextColor:UIColor?
        nextColor = fromColorSource?.navigationBarOutColor?()
        nextColor = toColorSource?.navigationBarInColor?()
        
        let containerView = transitionContext.containerView
        let shadowMask = UIView(frame: containerView.bounds)
        shadowMask.backgroundColor = UIColor.black
        shadowMask.alpha = 0.3
        
        let finalToFrame = transitionContext.finalFrame(for: toVC)
        toVC.view.frame = finalToFrame.offsetBy(dx: -finalToFrame.width/2, dy: 0)
        
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        containerView.insertSubview(shadowMask, aboveSubview: toVC.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        animating = true
        finishCancel = false
        let oldColor = fromColorSource?.navigationBarInColor?()
        
        toVC.navigationController?.navigationBar.rb.navigationView?.isHidden = false
        if #available(iOS 13.0, *) {
            toVC.navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
        } else {
            // Fallback on earlier versions
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: { () -> Void in
            fromVC.view.frame = fromVC.view.frame.offsetBy(dx: fromVC.view.frame.width, dy: 0)
            toVC.view.frame = finalToFrame
            shadowMask.alpha = 0
            if let navigationColor = nextColor {
                fromVC.navigationController?.navigationBar.rb.backgroundColor = navigationColor
            }
            
            }) { (finished) -> Void in
                self.animating = false
                shadowMask.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
                toVC.navigationController?.navigationBar.rb.navigationView?.isHidden = true
                if #available(iOS 13.0, *) {
                    toVC.navigationController?.navigationBar.standardAppearance.backgroundColor = self.finishCancel ? oldColor:nextColor
                } else {
                    // Fallback on earlier versions
                }
        }
    }
}
