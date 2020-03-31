//
//  SplashViewController.swift
//  Channels
//
//  Created by user on 3/31/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //shakeView(vw: containerView)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.splashTimeOut()
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateView()
    }
    
    func splashTimeOut(){
        let homeView = Container.getHomeScene()
        AppManager.shared.window?.rootViewController = homeView
        AppManager.shared.window?.makeKeyAndVisible()
        
    }
    private func animateView() {
let start = self.containerView.center

UIView.animateKeyframes(withDuration: 3, delay: 0, options: .calculationModeCubic, animations: {
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
//      UIView.animate(withDuration: 3.0,
//                     delay: 0.2,
//                     options: options,
//                     animations: { [weak self] in
//                      self?.containerView.frame.size.height *= 1.28
//                      self?.containerView.frame.size.width *= 1.28
//      }, completion: nil)
//
//      UIView.animate(withDuration: 2.4,
//                     delay: 0.1,
//                     options: options,
//                     animations: { [weak self] in
//                      self?.containerView.frame.size.height *= 1.15
//                      self?.containerView.frame.size.width *= 1.15
//      }, completion: nil)
//
//      UIView.animate(withDuration: 3.2,
//                     delay: 0.5,
//                     options: options,
//                     animations: { [weak self] in
//                      self?.containerView.frame.size.height *= 1.23
//                      self?.containerView.frame.size.width *= 1.23
//      }, completion: nil)
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
