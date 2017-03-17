//
//  LibraryDetailViewModel.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import Foundation

class LibraryDetailViewModel {

    private let library: Library
    
    init(library: Library) {
        self.library = library
    }
    
    var name: String {
        return "\(self.library.name_) Public Library"
    }
    
    var address: String {
        return self.library.address
    }
    
    var hoursOfOperation: [String] {
        let rawHoursString = self.library.hours_of_operation
        return rawHoursString.components(separatedBy: ";")
    }
    
    var location: Location {
        return self.library.location
    }
}
