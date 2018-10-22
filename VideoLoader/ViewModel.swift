//
//  ViewModel.swift
//  VideoLoader
//
//  Created by Sihang Huang on 10/22/18.
//  Copyright © 2018 Sihang Huang. All rights reserved.
//

import Foundation
import CryptoSwift

class ViewModel: NSObject {
    
    lazy var session: URLSession = {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        return session
    }()
    
    var dataTask: URLSessionDataTask?
    let appID: String = "1257882890"
    let secretID: String = "AKIDVvBIMIHrTuAHNYBpqqjS1QehaIqHKmpi"
    let secretKey: String = "ueEhz7KPVRFsKckikgU7ZosndLsFTWO5"
    
    func calculateSignature() {
//        SignKey = HMAC-SHA1(SecretKey,"[q-key-time]")
//        HttpString = [HttpMethod]\n[HttpURI]\n[HttpParameters]\n[HttpHeaders]\n
//        StringToSign = [q-sign-algorithm]\n[q-sign-time]\nSHA1-HASH(HttpString)\n
//        Signature = HMAC-SHA1(SignKey,StringToSign)
        
//        let signKey = try? HMAC(key: Array<UInt8>(hex: "secretKey"), variant: .sha1).authenticate(Array<UInt8>(hex: "[q-key-time]"))
        
    }
    
    func initMultiPartUpload() {
        if let url: URL = URL(string: "https://video-1257882890.cos.ap-guangzhou.myqcloud.com/Objects?uploads") {
            var request: URLRequest = URLRequest(url: url)
            request.setValue("video-1257882890.cos.ap-guangzhou.myqcloud.com", forHTTPHeaderField: "Host")
            request.httpMethod = "POST"
            let task = session.dataTask(with: request)
            task.resume()
            
            self.dataTask = task
        }
    }
}

extension ViewModel: URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        
    }
}
