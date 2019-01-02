//
//  ViewController.swift
//  Devref
//
//  Created by Konstantin on 06/11/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit
import SnapKit

class SchemeViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    var singleTapGestureRecognizer = UITapGestureRecognizer()
    var doubleTapGestureRecognizer = UITapGestureRecognizer()
    var hadlePinchDouble = UIPinchGestureRecognizer()
    
    var image: String? = String()
    var imageView = UIImageView()
    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        //imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imageView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3
        scrollView.zoomScale = 1
        
        setGestureRecognizer()
        
        imageView.image = UIImage(named: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            make in
            
            make.top.lessThanOrEqualTo(view)
            make.bottom.equalTo(view)
            make.right.left.equalTo(view)
            make.width.equalTo(view)
        }
        
        imageView.snp.makeConstraints {
            make in
            
            make.bottom.equalTo(scrollView)
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.height.equalTo(scrollView.snp.height)
            make.width.equalTo(scrollView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return gestureRecognizer === singleTapGestureRecognizer && otherGestureRecognizer === doubleTapGestureRecognizer
    }
    
    func setGestureRecognizer() {
        singleTapGestureRecognizer.addTarget(self, action: #selector(SchemeViewController.hadleSingleTap(recognizer:)))
        doubleTapGestureRecognizer.addTarget(self, action: #selector(SchemeViewController.handleDoubleTap(recognizer:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        hadlePinchDouble.addTarget(self, action: #selector(hadlePinch(sender: )))
        swipeDown.direction = .down
        swipeRight.direction = .right
        
        scrollView.addGestureRecognizer(swipeDown)
        scrollView.addGestureRecognizer(swipeRight)
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
        scrollView.addGestureRecognizer(doubleTapGestureRecognizer)
        singleTapGestureRecognizer.delegate = self
        doubleTapGestureRecognizer.delegate = self
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down:
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromBottom
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                view.window!.layer.add(transition, forKey: kCATransition)
                print("swipe down")
                dismiss(animated: false, completion: nil)
            case UISwipeGestureRecognizer.Direction.right:
                let transition = CATransition()
                transition.duration = 0.4
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromLeft
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                view.window!.layer.add(transition, forKey: kCATransition)
                print("swipe right")
                dismiss(animated: false, completion: nil)
            default:
                break
            }
        }
    }
    
    @ objc func hadleSingleTap(recognizer: UITapGestureRecognizer) {
        
        dismiss(animated: true, completion: nil)
    }
    @objc func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
    @objc func hadlePinch(sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else {
            return
        }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = ((sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!)
            sender.scale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    
    
    
    
    
    
    
    
}

