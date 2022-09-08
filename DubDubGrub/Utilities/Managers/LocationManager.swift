//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/4/22.
//

import CoreLocation
import Foundation

final class LocationManager: ObservableObject {
	
	@Published var locations: [DDGLocation] = []
    var selectedLocation: DDGLocation?
}
