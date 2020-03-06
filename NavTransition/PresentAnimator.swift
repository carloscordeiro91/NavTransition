//
//  PresentAnimator.swift
//  NavTransition
//
//  Created by itsector on 06/03/2020.
//  Copyright © 2020 itsector. All rights reserved.
//

import Foundation
import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(toViewController.view)
        
        let currentPos = toViewController.view.frame.origin
        
        toViewController.view.frame.origin = CGPoint(x: currentPos.x + toViewController.view.frame.width, y: currentPos.y)
        
        let duration =  self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            
            toViewController.view.frame.origin = CGPoint(x: currentPos.x, y: currentPos.y)
            
        }) { (sucess) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        
    }
    
}
