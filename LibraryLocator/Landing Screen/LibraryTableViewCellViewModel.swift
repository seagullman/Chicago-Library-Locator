//
//  LibraryTableViewCellViewModel.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import Foundation

class LibraryTableViewCellViewModel {
    
    private let library: Library
    
    init(library: Library) {
        self.library = library
    }
    
    var libraryName: String {
        return self.library.name_
    }
    
    var libraryAddress: String {
        return self.library.address
    }
}
