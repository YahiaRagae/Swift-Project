//
//  GetStores.swift
//  Swift Project
//
//  Created by Yahia on 7/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation
import Alamofire

class GetStores: JsonRequest<[Store]>{
    init(){
        super.init(method: .get, url: URL(string: "https://mopjapaneastgateway.plexure.io/store/v2/stores?latitude=26.333351598841787&longitude=127.79896146273005&radius=100000000&size=100")!)
        
    }
}
