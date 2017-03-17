//
//  LibraryDetailController.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import UIKit

class LibraryDetailController: UIViewController {
    
    @IBOutlet private var libraryDetailView: LibraryDetailView!
    var viewModel: LibraryDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = self.viewModel else { return }
        self.libraryDetailView.displayViewModel(viewModel: viewModel)
    }
}
