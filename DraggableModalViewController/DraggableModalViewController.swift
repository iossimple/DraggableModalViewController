//
//  DraggableModalViewController.swift
//  DraggableModalViewController
//
//  Created by Viet Nguyen Tran on 6/23/17.
//  Copyright © 2017 iossimple. All rights reserved.
//

import UIKit

class DraggableModalViewController: UIViewController {

    @IBAction func hanleGesture(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        view.frame.origin = CGPoint(x: 0, y: translation.y)
        
        if sender.state == .cancelled {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame.origin = CGPoint.zero
            })
        } else if sender.state == .ended {
            let progress = translation.y / view.bounds.size.height
            if progress > 1.0/3.0 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame.origin = CGPoint.zero
                })
            }
        }
    }

}
