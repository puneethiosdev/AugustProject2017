//
//  NetworkManager.swift
//  TransportMap
//
//  Created by Bheem Singh on 17/08/17.
//  Copyright © 2017 Sonia Yadav. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class NetworkManager {
    
    static let shareInstance: NetworkManager = NetworkManager()
    
    var AlamofireManager = Alamofire.SessionManager(configuration: .default)
    init() {
        let configration = URLSessionConfiguration.default
        configration.timeoutIntervalForRequest = 180 // second
        
        self.AlamofireManager = Alamofire.SessionManager(configuration: configration)
    }
    
    
    func callServiceWithName(_ serviceName:String, method: HTTPMethod, param: [String: Any] = ["":""], callbackSuccess:@ escaping(_ response: AnyObject) -> Void, callbackFaliure: @escaping (_ messgae:String) -> Void) {
    
        var header = [String: String]()
        
        
        AlamofireManager.request(serviceName, method: method, parameters: param, headers: header).responseJSON { response in
            
            switch response.result {
            case .success:
                callbackSuccess(response.result.value as AnyObject)
                break
                
            case .failure:
                callbackFaliure("Request failed due to error.")
                break
            }
            
        }
        
    }

    
    
    
}
