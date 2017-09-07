//
//  APIManager.swift
//  TransportMap
//
//  Created by Bheem Singh on 17/08/17.
//  Copyright © 2017 Sonia Yadav. All rights reserved.
//

import Foundation
import Alamofire

class APImanager {
    
    fileprivate static let baseUrl = "http://localhost:3000/api/v2.0/"
    
    enum APIService{
        
        case login(username: String, password: String)
        case register(username: String, password: String)
        case payment(placeId:String,number:String, name:String, cvv:String, expiryMonth:String, expiryYear:String)
        case places
        case savedCards
        
        
        var path: String {
            switch self {
            case .login , .register:
                return baseUrl + "users/"
            case .places:
                return baseUrl + "places/"
            case .payment,.savedCards:
                return baseUrl + "payments/"
                
            default:
                return ""
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case let .login(username, password):
                let params = ["email": username, "password": password]
                return params
                
            case let .register(username, password):
                let params = ["email": username, "password": password]
                return params
            
            case let .payment(placeId, number, name, cvv, expiryMonth, expiryYear):
                let params = ["placeId":placeId, "number": number, "name": name, "cvv": cvv, "expiryMonth": expiryMonth, "expiryYear": expiryYear]
                return params
                
            default:
                return ["": ""]
            }
        }
        
        var method: HTTPMethod {
            
            switch self {
            case .login:
                return .post
            case .register,.payment:
                return .put
            case .places, .savedCards:
                return .get
            
            default:
                return .post
            }
        }

        
        
    }
    
    
}
