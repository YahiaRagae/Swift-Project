//
//  StoresViewController.swift
//  Swift Project
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import UIKit

class StoresViewController: UITableViewController, StoryboardLoadable {
    
    var presenter = StoresPresenter()
    
    //MARK: - StoryboardLoadable
    static var storyboardName = "Main"
    static var identifier = "StoresViewController"
    
    //MARK: - IBOutlets
    
    //MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Accessibility
        tableView.accessibilityLabel = "OrderHistoryListTable"
        
        //init presenter
        presenter.view = self
        presenter.dataProvider = NetworkDataProvider()
        presenter.ready()
    }
    
    //MARK: - Tableview datasource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return presenter.storesCount()
     }
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreTableViewCell
        if let store = presenter.storeFor(at: indexPath.row) {
            cell.setStore(store: store)
        }
         return cell
     }
     
     //MARK: - Tableview delegate
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         presenter.showStoreDetails(at: indexPath.row)
     }
    
     
    
}

extension StoresViewController: StoresViewProtocol{
    func isLoading(status: Bool) {
        switch status {
        case true:
            print("show loading")
        case false:
            print("hide loading")
        }
    }
    
    func showData() {
        self.tableView.reloadData()
    }
    
    func showStoreDetails(store: Store) {
        let vc = StoreDetailsViewController.initFromStoryboard()
        vc.store = store
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showException(title: String, message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true)
    }
}
