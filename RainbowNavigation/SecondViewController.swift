//
//  SecondViewController.swift
//  RainbowNavigation
//
//  Created by Johnson on 2019/10/3.
//  Copyright © 2019 Johnson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, RainbowColorSource {
    
    func navigationBarInColor() -> UIColor {
        return .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }

}
