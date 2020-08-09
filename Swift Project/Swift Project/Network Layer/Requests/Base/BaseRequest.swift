//
//  BaseRequest.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation
import Alamofire

class BaseRequest: URLRequestConvertible{
    var urlRequest: URLRequest
    
    init(method: HTTPMethod, url: URL) {
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = method.rawValue
        self.urlRequest.timeoutInterval = 30
    }
    
    func asURLRequest() throws -> URLRequest {
        return urlRequest
    }
    
    func parseNetworkResponse(response: Any) -> Any? {
        fatalError("Must Override")
    }
    
    func setQueryParams(_ queryParams: Dictionary<String, String>) {
        var params = [String]()
        
        // Add all params in the dictionary received as query params in the query string
        for (key, value) in queryParams {
            let param = String(format: "%@=%@", key, value)
            params.append(param.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        }
        
        var urlComponents = URLComponents(url: self.urlRequest.url!, resolvingAgainstBaseURL: true)
        urlComponents!.percentEncodedQuery = params.joined(separator: "&")
        
        self.urlRequest.url = urlComponents!.url
    }
    
    func setBody(_ bodyDict: Dictionary<String, Any>) {
        // Setting the `Content-Type` of the request
        self.urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // Sending 0 as the "writting options" param because that's the same value sent by JSONRequestSerializer.
        do {
            try self.urlRequest.httpBody = JSONSerialization.data(withJSONObject: bodyDict, options: JSONSerialization.WritingOptions(rawValue: 0))
        } catch {
            print("Failed to serialize JSON object with error: \(error)")
        }
    }
    
}
