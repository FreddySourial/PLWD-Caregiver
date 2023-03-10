//
//  Business.swift
//  test.app
//
//  Created by Freddy Sourial on 2023-03-01.
//

import Foundation
import MapKit

struct Business: Identifiable{
    let id = UUID()
    let name : String
    let placemark: MKPlacemark
    let coordinate: CLLocationCoordinate2D
    let phonenNumber: String
    let website: URL?
}
