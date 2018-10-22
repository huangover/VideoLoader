//
//  ViewController.swift
//  VideoLoader
//
//  Created by Sihang Huang on 10/22/18.
//  Copyright © 2018 Sihang Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let vm: ViewModel = ViewModel()
    let button: UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(button)
        button.setTitle("初始化", for: .normal)
        button.addTarget(self, action: #selector(initButtonTapped), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        
    }

    @objc func initButtonTapped() {
        vm.initMultiPartUpload()
    }

}

