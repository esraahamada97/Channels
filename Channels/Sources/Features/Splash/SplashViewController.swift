//
//  SplashViewController.swift
//  Channels
//
//  Created by user on 3/31/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //shakeView(vw: containerView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
            self.splashTimeOut()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateView()
        //animationProperty()
    }
    
    func splashTimeOut() {
        let homeView = Container.getHomeScene()
        AppManager.shared.window?.rootViewController = homeView
        AppManager.shared.window?.makeKeyAndVisible()
        
    }
    
    private func animateView() {
        let start = self.containerView.center
        
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.containerView.transform = CGAffineTransform(scaleX: 2, y: 2)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.containerView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.containerView.center = CGPoint(x: self.view.bounds.width, y: start.y)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.containerView.center = start
            }
        })
        
    }
    
    func animationProperty() {
        let duration = 0.3
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.containerView.backgroundColor = .blue
        }

        // At any point during the runtime, we can amend the list of animations like so
        animator.addAnimations {
            self.containerView.transform = .init(scaleX: 1.5, y: 1.5)
        }

        animator.startAnimation()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
