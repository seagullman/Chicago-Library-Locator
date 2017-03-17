//
//  LibraryTableViewCell.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var libraryNameLabel: UILabel!
    @IBOutlet private weak var libraryAddressLabel: UILabel!
    
    func displayViewModel(viewModel: LibraryTableViewCellViewModel) {
        self.libraryNameLabel.text = viewModel.libraryName
        self.libraryAddressLabel.text = viewModel.libraryAddress
    }
}
