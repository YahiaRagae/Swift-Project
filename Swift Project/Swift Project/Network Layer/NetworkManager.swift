//
//  NetworkProvider.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager{
    
    static let shared = NetworkManager()
    var alamofireManager: Alamofire.Session?
    
    private init() {
        configureAlamofire()
    }
    
    func configureAlamofire() {
        alamofireManager = Session()
    }
    
    func sendRequest(_ baseRequest: BaseRequest, _ completionHandler: @escaping CompletionHandler) {
    
        // Send the request
        alamofireManager?.request(baseRequest).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                guard let data = response.data
                    else {
                    return
                }
                
                let responseData = baseRequest.parseNetworkResponse(response: data)
                completionHandler(responseData, nil)
                
            case .failure:
                guard let error = response.error
                    else {
                    return
                }

                completionHandler(nil, error)
            }
        }
    }
}


