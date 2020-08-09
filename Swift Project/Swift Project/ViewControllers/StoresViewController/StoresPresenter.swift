//
//  StoresPresenter.swift
//  Swift Project
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import Foundation

class StoresPresenter: StoresPresenterProtocol{
    
    weak var view: StoresViewProtocol?
    var dataProvider: DataProvider?
    
    private var stores: [Store] = []
    
    func ready() {
        view?.isLoading(status: true)
        
        dataProvider?.getStores({ (newStores, error) in
            self.view?.isLoading(status: false)
            
            guard let newStores = newStores as? [Store]  else {
                self.view?.showException(title: "Error", message: error?.localizedDescription ?? "error")
                return
            }
            self.stores = newStores
            self.view?.showData()
        })
    }
    
    func storeFor(at: Int) -> Store? {
        guard at < self.stores.count else {
            return nil
        }
        return stores[at]
    }
    
    func showStoreDetails(at: Int) {
        if let store = storeFor(at: at) {
            view?.showStoreDetails(store: store)
        }
    }
    
    func storesCount() -> Int {
        return stores.count
    }
    
}
