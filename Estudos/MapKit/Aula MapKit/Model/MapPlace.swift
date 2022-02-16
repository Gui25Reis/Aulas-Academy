//
//  MapPlace.swift
//  Aula MapKit
//
//  Created by Gui Reis on 24/11/21.
//

import CoreLocation
import MapKit


struct MapPlace {
    let name: String
    let coordinates: CLLocationCoordinate2D
    let pin: MKPointAnnotation
    let type: String

    let country: String
    let city: String
    let district: String
    let address: String
    let number: String

    let site: String
    let contact: String
}
