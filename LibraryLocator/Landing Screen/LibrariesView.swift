//
//  LibrariesView.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import UIKit

class LibrariesView: UIView {
    
    @IBOutlet fileprivate weak var librariesTableView: UITableView!
    fileprivate var viewModel: LibrariesViewModel?
    
    var delegate: LibrariesDelegate?

    func displayViewModel(viewModel: LibrariesViewModel) {
        self.viewModel = viewModel
        self.librariesTableView.reloadData()
    }
}

//MARK: UITableViewDelegate
extension LibrariesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedLibrary = self.viewModel?.libraries[indexPath.row] else { return }
        self.delegate?.didSelect(library: selectedLibrary)
        self.librariesTableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: UITableViewDataSource
extension LibrariesView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell",
                                                 for: indexPath) as! LibraryTableViewCell
        let cellViewModel = LibraryTableViewCellViewModel(
            library: (self.viewModel?.libraries[indexPath.row])!)
        cell.displayViewModel(viewModel: cellViewModel)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.libraries.count ?? 0
    }
}
