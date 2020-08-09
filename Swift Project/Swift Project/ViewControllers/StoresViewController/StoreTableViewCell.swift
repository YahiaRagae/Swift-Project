//
//  StoreTableViewCell.swift
//  Swift Project
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell{
    
    @IBOutlet weak var nameLable: UILabel!
    
    func setStore(store: Store){
        nameLable.text = store.name
    }
}
