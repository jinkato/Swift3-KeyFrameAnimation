//
//  ViewController.swift
//  KeyframeAnimation
//
//  Created by Jin Kato on 5/15/17.
//  Copyright © 2017 Jin Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    let blueBox:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let animateButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Animate", for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(handleAnimate), for: .touchUpInside)
        return btn
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutBlueBox()
        layoutAnimateButton()
    }

    //MARK: Layout
    
    func layoutBlueBox(){
        view.addSubview(blueBox)
        blueBox.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueBox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blueBox.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blueBox.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func layoutAnimateButton(){
        view.addSubview(animateButton)
        animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animateButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        animateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    //MARK: Handler
    
    func handleAnimate(){
        let originalCenter = blueBox.center
        let animationOptions: UIViewAnimationOptions = .curveEaseOut
        let keyframeAnimationOptions = UIViewKeyframeAnimationOptions(rawValue: animationOptions.rawValue)
        
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: keyframeAnimationOptions, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 2.0, animations: {
                self.blueBox.center.x += 300
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.5, animations: {
                self.blueBox.alpha = 0
                let angle =  CGFloat(M_PI_2)
                let tr = CGAffineTransform.identity.rotated(by: angle)
                self.blueBox.transform = tr
            })
            UIView.addKeyframe(withRelativeStartTime: 2.0, relativeDuration: 1.0, animations: { 
                self.blueBox.center = originalCenter
                self.blueBox.alpha = 1
            })
        }, completion: nil)
    }
    
}

