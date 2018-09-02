//
//  RestfulService.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit
import Alamofire

class RestfulService {
    
    static let shared = RestfulService()
    private var commonError = "Request failed"
    
    var manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 300
        configuration.timeoutIntervalForResource = 3600
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
    
    func getRequest(url: String, headers: [String : String] = [:], successful: @escaping (Data) -> (), failure: @escaping (String) -> ()) {
        manager.request(url, method: .get, headers: headers).response { (response) in
            if response.error != nil {
                failure((response.error?.localizedDescription)!)
            } else {
                successful(response.data!)
            }
        }
    }
    
    func postRequest(url: String, parameters: [String : String], completion: @escaping ((DataResponse<Any>) -> ())) {
        manager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                completion(response)
        }
    }
    
    func cancelAllRequests() {
        manager.session.invalidateAndCancel()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 3600
        configuration.timeoutIntervalForResource = 3600
        manager = Alamofire.SessionManager(configuration: configuration)
    }
    
}
