//
//  NetworkDataProvider.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation

class NetworkDataProvider: DataProvider {
    func getStores(_ completionHandler: @escaping CompletionHandler) {
        executeRequest(GetStores(), completionHandler)
    }
    
    private func executeRequest(_ request: BaseRequest, _ completionHandler: @escaping CompletionHandler) {
        NetworkManager.shared.sendRequest(request) { (_ data: Any, _ error: Error?) in
            completionHandler(data, error)
        }
    }
}
