//
//  JsonRequest.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation

class JsonRequest<T: Codable>: BaseRequest {
    override func parseNetworkResponse(response: Any) -> Any? {
        guard let data = response as? Data else{
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error decoding \(T.self): \(error)")
        }
        
        return nil
    }
}

