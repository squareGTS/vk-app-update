//
//  LoadingViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 19.05.2021.
//

import UIKit


class LoadingViewController: UIViewController {
    
    @IBOutlet weak var firstDot: UIView!
    @IBOutlet weak var secondDot: UIView!
    @IBOutlet weak var thirdDot: UIView!
    @IBOutlet weak var forthDot: UIView!
    @IBOutlet weak var fivethDot: UIView!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstDot.layer.cornerRadius = firstDot.bounds.height / 2
        secondDot.layer.cornerRadius = secondDot.bounds.height / 2
        thirdDot.layer.cornerRadius = thirdDot.bounds.height / 2
        forthDot.layer.cornerRadius = forthDot.bounds.height / 2
        fivethDot.layer.cornerRadius = fivethDot.bounds.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animation()
        pathAnimation()
    }
    
    //MARK:- Animation of dots
    func animation() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations:
                                    {
                                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3) {
                                            self.firstDot.alpha = 0
                                        }
                                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3) {
                                            self.firstDot.alpha = 1
                                            self.secondDot.alpha = 0
                                        }
                                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3) {
                                            self.secondDot.alpha = 1
                                            self.thirdDot.alpha = 0
                                        }
                                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3) {
                                            self.thirdDot.alpha = 1
                                            self.forthDot.alpha = 0
                                        }
                                        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3) {
                                            self.forthDot.alpha = 1
                                            self.fivethDot.alpha = 0
                                        }
                                    }) { _ in
            self.firstDot.alpha = 1
            if self.counter < 1 {
                self.counter += 1
                self.animation()
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                loginViewController.modalPresentationStyle = .fullScreen
                self.present(loginViewController, animated: true, completion: nil)
            }
        }
    }
    
    //MARK:- Animation of VK
    func pathAnimation() {
        
        let vkView = UIView()
        
        view.addSubview(vkView)
        vkView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vkView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            vkView.bottomAnchor.constraint(equalTo: firstDot.topAnchor, constant: -15),
            vkView.widthAnchor.constraint(equalToConstant: 120),
            vkView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 30, y: 70))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: 20, y: 0), controlPoint: CGPoint(x: -5, y: -10))
        
        path.addLine(to: CGPoint(x: 50, y: 60))
        path.addLine(to: CGPoint(x: 65, y: 5))
        path.addLine(to: CGPoint(x: 85, y: 0))
        
        path.addLine(to: CGPoint(x: 70, y: 70))
        path.addLine(to: CGPoint(x: 100, y: 70))
        path.addLine(to: CGPoint(x: 100, y: 0))
        
        path.addLine(to: CGPoint(x: 120, y: 0))
        path.addLine(to: CGPoint(x: 120, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 70))
        path.addLine(to: CGPoint(x: 120, y: 35))
        
        path.addLine(to: CGPoint(x: 150, y: 0))
        path.addLine(to: CGPoint(x: 120, y: 0))
        path.addLine(to: CGPoint(x: 120, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 70))
        
        let layerAnimation = CAShapeLayer()
        layerAnimation.path = path.cgPath
        layerAnimation.strokeColor = #colorLiteral(red: 0.1725490196, green: 0.2823529412, blue: 0.4274509804, alpha: 1)
        layerAnimation.fillColor = UIColor.clear.cgColor
        layerAnimation.lineWidth = 8
        layerAnimation.lineCap = .round
        
        vkView.layer.addSublayer(layerAnimation)
        
        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.fromValue = 0
        pathAnimationStart.toValue = 1
        pathAnimationStart.duration = 2
        pathAnimationStart.fillMode = .both
        pathAnimationStart.isRemovedOnCompletion = false
        pathAnimationStart.beginTime = 1
        
        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationEnd.fromValue = 0
        pathAnimationEnd.toValue = 1
        pathAnimationEnd.duration = 2
        pathAnimationEnd.fillMode = .both
        pathAnimationEnd.isRemovedOnCompletion = false
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 5
        animationGroup.animations = [pathAnimationEnd, pathAnimationStart]
        layerAnimation.add(animationGroup, forKey: nil)
    }
}
