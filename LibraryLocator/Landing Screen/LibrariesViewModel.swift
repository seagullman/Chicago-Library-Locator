//
//  LibrariesViewModel.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import Foundation

class LibrariesViewModel {
    
    private let _libraries: [Library]
    
    init(libraries: [Library]) {
        self._libraries = libraries
    }
    
    var libraries: [Library] {
        return self._libraries
    }
}
