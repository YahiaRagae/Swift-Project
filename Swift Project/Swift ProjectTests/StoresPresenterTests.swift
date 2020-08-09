//
//  StoresPresenterTests.swift
//  Swift ProjectTests
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import XCTest
@testable import Swift_Project
class StoresPresenterTests: XCTestCase {
    
    let dataProvider = MockDataProvider()
    let presenter = StoresPresenter()
    
    func testStoreFor_Success(){
        //Given
        presenter.dataProvider = dataProvider
        
        //When
        presenter.ready()
        let store = presenter.storeFor(at: 0)
        
        // Then
        XCTAssertNotNil(store)
        
    }
    
    func testStoreFor_Fail(){
        //Given
        presenter.dataProvider = dataProvider
        
        //When
        presenter.ready()
        let store = presenter.storeFor(at: 10)
        
        // Then
        XCTAssertNil(store)
        
    }
    
    func teststoresCount(){
        //Given
        presenter.dataProvider = dataProvider
        
        //When
        presenter.ready()
        let storesCount = presenter.storesCount()
        
        // Then
        XCTAssertEqual(storesCount, 2)
        
    }

}
