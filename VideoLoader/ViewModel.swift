//
//  ViewModel.swift
//  VideoLoader
//
//  Created by Sihang Huang on 10/22/18.
//  Copyright © 2018 Sihang Huang. All rights reserved.
//

import Foundation
import CryptoKit
import SweetHMAC

class ViewModel: NSObject {
    
    lazy var session: URLSession = {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        return session
    }()
    
    var dataTask: URLSessionDataTask?
    let appID: String = "1257882890"
    let secretID: String = "AKIDVvBIMIHrTuAHNYBpqqjS1QehaIqHKmpi"
    let secretKey: String = "ueEhz7KPVRFsKckikgU7ZosndLsFTWO5"
    
    var authValue: String? {
        let now = Date()
        let qSignTimeStart = now.timeIntervalSince1970
        let qSignTimeEnd = now.addingTimeInterval(1 * 24 * 60 * 60).timeIntervalSince1970
        let qSignTime = "\(qSignTimeStart);\(qSignTimeEnd)"
        
        
        let signature =
            getSignature(secretKey: secretKey,
                            httpMethod: "post",
                            httpURI: "/Object",
                            httpParameters: "uploads",
                            httpHeaders: "host=video-1257882890.cos.ap-guangzhou.myqcloud.com",
                            qSignAlgorithm: "sha1",
                            qSignTime: qSignTime)
        
        guard let sig = signature else {
            
            return nil
        }
        
        let authHeaderValue =
            getAuthHeaderValue(qSignAlgorithm: "sha1",
                                  qAK: secretID,
                                  qSignTime: qSignTime,
                                  qKeyTime: qSignTime,
                                  qHeaderList: "host",
                                  qURLParameterList: "uploads",
                                  qSignature: sig)
        return authHeaderValue
    }
    
    
    func getSignature(secretKey:String, httpMethod: String, httpURI: String, httpParameters: String, httpHeaders: String, qSignAlgorithm: String, qSignTime: String) -> String? {
        
        //        SignKey = HMAC-SHA1(SecretKey,"[q-key-time]")
        //        HttpString = [HttpMethod]\n[HttpURI]\n[HttpParameters]\n[HttpHeaders]\n
        //        StringToSign = [q-sign-algorithm]\n[q-sign-time]\nSHA1-HASH(HttpString)\n
        //        Signature = HMAC-SHA1(SignKey,StringToSign)
        
        
        let signKey = qSignTime.hmac(algorithm: .SHA1, key: secretKey)
        let httpString: String = "\(httpMethod)\n\(httpURI)\n\(httpParameters)\n\(httpHeaders)\n"
        
        guard let httpStringSha1: String = httpString.sha1 else {
            return nil
        }
        
        let stringToSign: String = "\(qSignAlgorithm)\n\(qSignTime)\n\(httpStringSha1)\n"
       
        let signature = stringToSign.hmac(algorithm: .SHA1, key: signKey)
        
        return signature
    }
    
    func getAuthHeaderValue(qSignAlgorithm: String, qAK: String, qSignTime: String, qKeyTime: String, qHeaderList: String, qURLParameterList: String, qSignature: String) -> String {
        
        let authHeaderValue =
        """
        q-sign-algorithm=\(qSignAlgorithm)&q-ak=\(qAK)&q-sign-time=\(qSignTime)&q-key-time=\(qSignTime)&q-header-list=\(qHeaderList)&q-url-param-list=\(qURLParameterList)&q-signature=\(qSignature)
        """
        
        return authHeaderValue
    }
    
    
    func initMultiPartUpload() {
        if let url: URL = URL(string: "https://video-1257882890.cos.ap-guangzhou.myqcloud.com/Objects?uploads") {
            var request: URLRequest = URLRequest(url: url)
            request.setValue("video-1257882890.cos.ap-guangzhou.myqcloud.com", forHTTPHeaderField: "Host")
            request.setValue(authValue, forHTTPHeaderField: "Authorization")
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
        completionHandler(.performDefaultHandling, nil)
    }
    
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        
    }
    
}

extension ViewModel: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        
    }
    
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: @escaping (InputStream?) -> Void) {
        
    }
    
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        
    }
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics)  {
        
    }
    
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)  {
        
    }
}

extension ViewModel: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        completionHandler(.allow)
    }
    
    
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask) {
        
    }
    
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome streamTask: URLSessionStreamTask) {
        
    }
    
    
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
    }
    
    
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, completionHandler: @escaping (CachedURLResponse?) -> Void) {
        
    }
}

