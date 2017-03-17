//
//  LibrariesController.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import UIKit

protocol LibrariesDelegate: class {
    func didSelect(library: Library)
}

class LibrariesController: UIViewController,
                           LibrariesDelegate {
    
    @IBOutlet private var librariesView: LibrariesView!
    private let client = NetworkClient()
    private var selectedLibraryViewModel: LibraryDetailViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.librariesView.delegate = self
        client.getLibraries { (libraries) in
            self.librariesView.displayViewModel(viewModel: LibrariesViewModel(libraries: libraries))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LibraryDetailController,
            let selectedViewModel = self.selectedLibraryViewModel {
            destination.viewModel = selectedViewModel
        }
    }
    
    func didSelect(library: Library) {
        self.selectedLibraryViewModel = LibraryDetailViewModel(library: library)
        self.performSegue(withIdentifier: "libraryDetailSegue", sender: nil)
    }
}

