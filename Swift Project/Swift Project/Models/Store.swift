//
//  Store.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation

class Store: Codable{
    var `id`: Int?
    var name: String?
    var address: String?
    var latitude: Double?
    var longitude: Double?
    var featureList: [String]?
}
