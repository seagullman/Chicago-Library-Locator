//
//  Location.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import Foundation

class Location: NSObject {
    let needs_recoding: Bool
    let longitude: Double
    let latitude: Double

    init(dict: [String: AnyObject]) {
        self.needs_recoding = dict["needs_recoding"] as? Bool ?? false
        self.longitude = Double(dict["longitude"] as? String ?? "") ?? 0
        self.latitude = Double((dict["latitude"] as? String) ?? "") ?? 0
    }
}
