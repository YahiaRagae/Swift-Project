//
//  StoreDetailsViewController.swift
//  Swift Project
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import UIKit

class StoreDetailsViewController: UIViewController, StoryboardLoadable{
     //MARK: - StoryboardLoadable
    static var identifier = "StoreDetailsViewController"
    
    //MARK: - properties
    var store: Store?
    
    //MARK: - IBOutlets
    @IBOutlet weak var storeNameLabel: UILabel!
    
    //MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    //MARK: - Private methods
    private func initUI() {
        if let store = store {
            storeNameLabel.text = store.name
        }
    }
}
