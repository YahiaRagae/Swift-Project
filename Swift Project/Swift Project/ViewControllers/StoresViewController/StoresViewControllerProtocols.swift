//
//  StoresViewControllerProtocols.swift
//  Swift Project
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation
import UIKit

protocol StoresViewProtocol where Self: UIViewController {
    func showData()
    func showStoreDetails(store: Store)
    func showException(title: String, message: String)
    func isLoading(status: Bool)
}

protocol StoresPresenterProtocol {
    func ready()
    func storeFor(at: Int) -> Store?
    func showStoreDetails(at: Int)
    func storesCount() -> Int
}
