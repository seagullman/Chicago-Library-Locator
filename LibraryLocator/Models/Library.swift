//
//  Library.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import Foundation

class Library: NSObject {
    
    let zip: String
    let phone: String
    let teacher_in_the_library: String
    let location: Location
    let websiteURL: String
    let address: String
    let hours_of_operation: String
    let state: String
    let cybernavigator: String
    let name_: String
    let city: String
    
    init(dict: [String: AnyObject]) {
        self.zip = dict["zip"] as? String ?? ""
        self.phone = dict["phone"] as? String ?? ""
        self.teacher_in_the_library = dict["teacher_in_the_library"] as? String ?? ""
        self.location = Location(dict: dict["location"] as! [String : AnyObject])
        let websiteObject = dict["url"]
        self.websiteURL = websiteObject?["message"] as? String ?? ""
        self.address = dict["address"] as? String ?? ""
        self.hours_of_operation = dict["hours_of_operation"] as? String ?? ""
        self.state = dict["state"] as? String ?? ""
        self.cybernavigator = dict["cybernavigator"] as? String ?? ""
        self.name_ = dict["name_"] as? String ?? ""
        self.city = dict["city"] as? String ?? ""
    }
}
