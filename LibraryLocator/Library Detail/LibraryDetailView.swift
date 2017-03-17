//
//  LibraryDetailView.swift
//  LibraryLocator
//
//  Created by Brad Siegel on 3/17/17.
//  Copyright © 2017 Brad Siegel. All rights reserved.
//

import UIKit
import MapKit

class LibraryDetailView: UIView {
    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var hoursOfOperationStackView: UIStackView!
    @IBOutlet private weak var libraryNameLabel: UILabel!
    @IBOutlet private weak var libraryAddressLabel: UILabel!
    
    func displayViewModel(viewModel: LibraryDetailViewModel) {
        self.libraryNameLabel.text = viewModel.name
        self.libraryAddressLabel.text = viewModel.address
        //Create label for each parsed string and add it to stackview
        viewModel.hoursOfOperation.forEach { (string) in
            let label = UILabel()
            label.text = string
            self.hoursOfOperationStackView.addArrangedSubview(label)
        }
        
        let latitude = viewModel.location.latitude
        let longitude = viewModel.location.longitude
        let title = viewModel.name
        self.showMapAnnotation(latitude: latitude,
                               longitude: longitude,
                               title: title)
        
        //set initial map zoom
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(
            latitude: viewModel.location.latitude,
            longitude: viewModel.location.longitude),
                                        span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func showMapAnnotation(latitude: Double, longitude: Double, title: String) {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude,
                                                      longitude: longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
        //show annotation by default
        mapView.selectAnnotation(mapView.annotations[0], animated: true)

    }
}
