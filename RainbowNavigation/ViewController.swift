//
//  ViewController.swift
//  RainbowNavigation
//
//  Created by Johnson on 2019/10/3.
//  Copyright © 2019 Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RainbowColorSource {
    
    func navigationBarInColor() -> UIColor {
        return .red
    }
    
    var rainbowNavigation: RainbowNavigation?
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(nextAction(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupNavigationBar() {
        if !(self.navigationController?.navigationBar.rb.isNavigationViewExist ?? true) {
            self.navigationController?.navigationBar.rb.backgroundColor = navigationBarInColor()
            self.navigationController?.navigationBar.rb.statusBarColor = navigationBarInColor()
            self.rainbowNavigation = RainbowNavigation()
            self.rainbowNavigation?.wireTo(self.navigationController!)
        }
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = navigationBarInColor()
            navigationController?.navigationBar.standardAppearance = appearance
        } else {
            navigationController?.navigationBar.backgroundColor = navigationBarInColor()
        }

        self.navigationController?.navigationBar.tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "PingFangSC-Semibold", size: 16) ?? UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc private func nextAction(_ sender: UIButton) {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

