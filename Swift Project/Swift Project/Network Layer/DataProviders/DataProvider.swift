//
//  DataProvider.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation

public typealias CompletionHandler = (_ data: Any?, _ error: Error?) -> Void

protocol DataProvider{
    func getStores(_ completionHandler: @escaping CompletionHandler)
}
