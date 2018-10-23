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

//        let signature =
//        vm.getSignature(secretKey: "BQYIM75p8x0iWVFSIgqEKwFprpRSVHlz",
//                        httpMethod: "put",
//                        httpURI: "/testfile2",
//                        httpParameters: "",
//                        httpHeaders: "host=bucket1-1254000000.cos.ap-beijing.myqcloud.com&x-cos-content-sha1=7b502c3a1f48c8609ae212cdfb639dee39673f5e&x-cos-storage-class=standard",
//                        qSignAlgorithm: "sha1",
//                        qSignTime: "1417773892;1417853898")
//
//        guard let sig = signature else {
//
//            return
//        }
//
//        let authHeaderValue =
//        vm.getAuthHeaderValue(qSignAlgorithm: "sha1",
//                              qAK: "AKIDQjz3ltompVjBni5LitkWHFlFpwkn9U5q",
//                              qSignTime: "1417773892;1417853898",
//                              qKeyTime: "1417773892;1417853898",
//                              qHeaderList: "host;x-cos-content-sha1;x-cos-storage-class",
//                              qURLParameterList: "",
//                              qSignature: sig)
        
        
    }
    
    //Authorization: q-sign-algorithm=sha1&q-ak=AKIDWtTCBYjM5OwLB9CAwA1Qb2ThTSUjfGFO&q-sign-time=1484727259;32557623259&q-key-time=1484727259;32557623259&q-header-list=host&q-url-param-list=uploads&q-signature=b5f46c47379aeaee74be7578380b193c01b28045



}

