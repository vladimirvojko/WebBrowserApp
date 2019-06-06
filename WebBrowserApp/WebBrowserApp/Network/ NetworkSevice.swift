//
//   NetworkSevice.swift
//  WebBrowserApp
//
//  Created by Developer on 6/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

typealias SuccessBlock = ([String:Any]) -> Void
typealias FailureBlock = (Error) -> Void

enum  HttpMethod: String{
    case get = "GET"
}

class NetworkService {
    func GET(url:String, parameters:[String : Any], success: SuccessBlock, failure: FailureBlock) -> URLSessionDataTask {
        
    }
    
    
    private func serviceHit(url:String, method: HttpMethod, parametrs:[String:Any], headers:[String: Any], success: @escaping SuccessBlock, failure: @escaping FailureBlock) {
        var headers = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"]
        
        var request: URLRequest = URLRequest(url: URL(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                failure(error!)
            } else {
                guard  let httpResponse = response as? HTTPURLResponse else { return }
                httpResponse.statusCode
            }
            
        }
    }
}
