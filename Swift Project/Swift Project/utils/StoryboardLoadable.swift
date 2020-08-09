//
//  StoryboardLoadable.swift
//  Swift Project
//
//  Created by Yahia on 9/08/20.
//  Copyright © 2020 Yahia. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    static var storyboardName: String { get }
    static var identifier: String { get }
    static func initFromStoryboard() -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    
    //Set the default storyboardName to "Main"
    static var storyboardName: String {
        return "Main"
    }
    
    static func initFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }

}
