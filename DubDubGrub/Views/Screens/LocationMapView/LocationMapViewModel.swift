//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/4/22.
//

import Foundation
import SwiftUI
import MapKit

@MainActor
final class LocationMapViewModel: NSObject, ObservableObject {
	
	@Published var isShowingOnboardView = false
	@Published var alertItem: AlertItem?
	
	@Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516,
																			  longitude: -121.891054),
											   span: MKCoordinateSpan(latitudeDelta: 0.01,
																	  longitudeDelta: 0.01))
	
	var deviceLocationManager: CLLocationManager?
	let kHasSeenOnboardView = "hasSeenOnboardView"
	
	var hasSeenOnboardView: Bool {
		UserDefaults.standard.bool(forKey: kHasSeenOnboardView)
	}
	
	func runStartupChecks() {
		if !hasSeenOnboardView {
			isShowingOnboardView = true
			UserDefaults.standard.set(true, forKey: kHasSeenOnboardView)
		} else {
			checkIfLocationServicesIsEnabled()
		}
	}
	
	func checkIfLocationServicesIsEnabled() {
		if CLLocationManager.locationServicesEnabled() {
			deviceLocationManager = CLLocationManager()
			deviceLocationManager!.delegate = self
		} else {
			alertItem = AlertContext.locationDisabled
		}
	}
	
	func checkLocationAuthorization() {
		guard let manager = deviceLocationManager else { return }
		
		switch manager.authorizationStatus {
			case .notDetermined:
				manager.requestWhenInUseAuthorization()
			case .restricted:
				alertItem = AlertContext.locationRestricted
			case .denied:
				alertItem = AlertContext.locationDenied
			case .authorizedAlways, .authorizedWhenInUse:
				break
			@unknown default:
				break
		}
 	}
	
	func getLocations(for locationManager: LocationManager) {
        CloudKitManager.shared.getLocations { [self] result in
			DispatchQueue.main.async {
				switch result {
					case .failure:
						alertItem = AlertContext.unableToGetLocations
						
					case let .success(locations):
						locationManager.locations = locations
				}
			}
		}
	}
}

extension LocationMapViewModel: CLLocationManagerDelegate {
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkLocationAuthorization()
	}
}
