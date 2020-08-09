//
//  StoryboardLoadableTests.swift
//  Swift ProjectTests
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import XCTest
@testable import Swift_Project

class StoryboardLoadableTests: XCTestCase {
    func testinitFromStoryboard() {
        //When
        let vc = StoreDetailsViewController.initFromStoryboard()
        
        //then
        XCTAssertNotNil(vc)
    }
}
