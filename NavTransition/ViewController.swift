//
//  ViewController.swift
//  NavTransition
//
//  Created by itsector on 06/03/2020.
//  Copyright © 2020 itsector. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.delegate = self
    }


    @IBAction func pushVC(_ sender: Any) {
        
        performSegue(withIdentifier: "NewVCSegue", sender: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
            
        case .push:
            return PresentAnimator()
            
        case .pop:
            return nil
            
        default:
            return nil
            
        }
    }
}
