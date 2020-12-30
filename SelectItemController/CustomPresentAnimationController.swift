//
//  CustomPresentAnimationController.swift
//  SelectItemController
//
//  Created by keygx on 2017/03/14.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit

class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SelectItemViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)
        
        toViewController.dialogView?.alpha = 0.2
        toViewController.dialogView?.transform = CGAffineTransform(scaleX: 1.16, y: 1.16)
        toViewController.stackView.alpha = 0.2
        toViewController.stackView.transform = CGAffineTransform(scaleX: 1.16, y: 1.16)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0.0,
                       options: [.curveEaseIn, .curveEaseOut],
                       animations: {
                toViewController.dialogView?.alpha = 1.0
                toViewController.dialogView?.transform = CGAffineTransform.identity
                toViewController.stackView.alpha = 1.0
                toViewController.stackView.transform = CGAffineTransform.identity
            
            }, completion: { _ in
                transitionContext.completeTransition(true)
        })
    }
}
