//
//  UIKitExtensions.swift
//  iOSTask
//
//  Created by Shreedharshan on 20/09/23.
//

import Foundation
import UIKit



extension UIView {
    
    func animateShowView(_ duration: Double = 0.4) {
        UIView.transition(with: self, duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {
            self.isHidden = false
            
        })
    }
    
    func fadeAnimateView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 0.0
        }) { (finished) in
            
            if finished {
                self.isHidden = true
            }
        }
    }
    
    func zoomToOriginalForm(_ duration: Double = 0.4) {
        self.isHidden = false
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: duration, animations: {
            self.transform = .identity
            self.alpha = 1.0
        })
    }
    
    func animateViewFromLeftToRight(_ duration: Double = 0.4, vc: UIViewController) {
        
        self.isHidden = false
        self.transform = CGAffineTransform(translationX: vc.view.bounds.width, y: 0)
        UIView.animate(withDuration: duration) {
            
            self.transform = CGAffineTransform.identity
            self.alpha = 1.0
        }
    }
    
    func animateViewFromTopToBottom(_ duration: Double = 0.4) {
        
        self.isHidden = false
        let originalY = self.frame.origin.y
        self.frame.origin.y = self.frame.origin.y - 50
        UIView.animate(withDuration: duration) {
            self.frame.origin.y = originalY
        }
    }
    
    func animateViewFromTopToBottomSecMethod(_ duration: Double = 0.4) {
        
        self.isHidden = false
        self.alpha = 0
        let originalY = self.frame.origin.y
        self.frame.origin.y = self.frame.origin.y + 40
        UIView.animate(withDuration: duration) {
            self.alpha = 1
            self.frame.origin.y = originalY
        }
    }
    
    func animateViewFromBottomToTop(_ duration: Double = 0.4, vc: UIViewController) {
        
        self.isHidden = false
        let originalY = vc.view.frame.height - self.frame.height
        self.frame = CGRect(x: 0, y: vc.view.frame.height, width: self.frame.width, height: self.frame.height)
        UIView.animate(withDuration: duration) {
            self.frame = CGRect(x: 0, y: originalY, width: self.frame.width, height: self.frame.height)
        }
    }
    
    func flashAView(_ flash: Bool) {
        if flash {
            UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse, .repeat,.allowUserInteraction], animations: {
                self.alpha = 0.6
            }, completion: nil)
        } else {
            self.layer.removeAllAnimations()
            self.alpha = 1.0
        }
        
    }
    
}
