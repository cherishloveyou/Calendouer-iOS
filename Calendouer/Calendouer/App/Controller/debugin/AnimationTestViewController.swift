//
//  AnimationTestViewController.swift
//  Calendouer
//
//  Created by 段昊宇 on 2017/3/29.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class AnimationTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let animationView = LOTAnimationView.animationNamed("refresh-cal.json")
        animationView?.frame = view.bounds;
        animationView?.loopAnimation = true;
        self.view.addSubview(animationView!)
        animationView?.play(completion: { finished in
            print("hello world")
        })
        
    }

}
