//
//   NetworkSevice.swift
//  WebBrowserApp
//
//  Created by Developer on 6/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

typealias SuccessBlock = ([Any]) -> Void
typealias FailureBlock = (Error) -> Void

enum  HttpMethod: String{
    case get = "GET"
}

class NetworkService {
    func GET(url:String, parameters:[String : Any], success: @escaping SuccessBlock, failure: @escaping FailureBlock) -> URLSessionDataTask {
        return self.serviceHit(url: url, method: .get, parametrs: parameters, headers: nil, success: success, failure: failure)
    }
    
    
    private func serviceHit(url:String, method: HttpMethod, parametrs:[String:Any], headers:[String: Any]?, success: @escaping SuccessBlock, failure: @escaping FailureBlock) -> URLSessionDataTask {
        let headers = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"]
        
        var request: URLRequest = URLRequest(url: URL(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                failure(error!)
            } else {
                guard  let httpResponse = response as? HTTPURLResponse else { return }
                print(httpResponse.statusCode)
                
                if httpResponse.statusCode == 200, let responseData: Data = data {
                    let json = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    if json is [Any] {
//                        success(json)
                    }
                    
                    
                    
                }
            }
            
        }
        return dataTask
    }
}
