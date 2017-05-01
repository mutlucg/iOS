//
//  ViewController.swift
//  hw5
//
//  Created by Mutlu Can Gurbuz on 11/03/17.
//  Copyright © 2017 Mutlu Can Gurbuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    var endPoint : String = "\(0)"
    var divisorOfTargetX : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let screenSize: CGRect = UIScreen.main.bounds
        let xx : Int = (Int(screenSize.width))/4
        divisorOfTargetX = xx
        let yy : Int = 60
        
        scrollView.contentSize = CGSize(width: xx * 16, height: yy)
        
        for i in 0..<10{
            let label = UILabel(frame: CGRect(x: i*xx, y: 0, width: xx, height: yy))
            label.textAlignment = NSTextAlignment.center
            label.text = "\(i)"
            scrollView.addSubview(label)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(Int(targetContentOffset.pointee.x) <= Int(divisorOfTargetX*10)){
            endPoint = "\(Int(targetContentOffset.pointee.x)/divisorOfTargetX)"
        }else {
            endPoint = "N/A"
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        label.text = endPoint
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        label.text = endPoint
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        label.text = " "
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        label.text = endPoint
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        label.text = " "
    }
}

