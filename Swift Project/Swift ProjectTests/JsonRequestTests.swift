//
//  JsonRequestTests.swift
//  Swift ProjectTests
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation
import XCTest
@testable import Swift_Project

class JsonRequestTests: XCTestCase {
    func testParseNetworkResponse() {
        //Given
        let storeRequest = JsonRequest<[Store]>(method: .post, url: URL(string: "http://www.google.com")!)
        let jsonData = """
        [{"id":47510,"name":"中の町サンエー店","address":"沖縄県沖縄市胡屋２－１－５６","latitude":26.333247166466784,"longitude":127.79904451289327,"featureList":["FRONT_COUNTER_EAT_IN","TABLE_DELIVERY"],"openingHours":[{"date":"2020-08-09T00:00:00","day":"Sunday","breakfastMenuHours":null,"dayMenuHours":{"startTime":"09:10:00","endTime":"20:30:00"},"tableDeliveryHours":{"startTime":"07:00:00","endTime":"22:00:00"},"curbSideDeliveryHours":{"startTime":"07:00:00","endTime":"22:00:00"},"comment":null}]},{"id":47018,"name":"上地店","address":"沖縄県沖縄市上地４－２１－６","latitude":26.33607123481496,"longitude":127.79312858510977,"featureList":["FREE_WIFI","DRIVETHR","BF","FRONT_COUNTER_EAT_IN","CURB_SIDE_DELIVERY","TABLE_DELIVERY"],"openingHours":[{"date":"2020-08-09T00:00:00","day":"Sunday","breakfastMenuHours":{"startTime":"06:10:00","endTime":"10:30:00"},"dayMenuHours":{"startTime":"10:30:00","endTime":"23:30:00"},"tableDeliveryHours":{"startTime":"07:00:00","endTime":"22:00:00"},"curbSideDeliveryHours":{"startTime":"07:00:00","endTime":"22:00:00"},"comment":null}]}]
        """.data(using: .utf8)
        //When
        let stores = storeRequest.parseNetworkResponse(response: jsonData as Any) as? [Store]
        
        //then
        XCTAssertEqual(stores?.count, 2)
    }
}

