//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/4/22.
//

import CloudKit
import Foundation
import SwiftUI
import MapKit

@MainActor
final class LocationMapViewModel: ObservableObject {
	
    @Published var checkedInProfiles: [CKRecord.ID: Int] = [:]
    @Published var isShowingDetailView = false
	@Published var alertItem: AlertItem?
	
	@Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516,
																			  longitude: -121.891054),
											   span: MKCoordinateSpan(latitudeDelta: 0.01,
																	  longitudeDelta: 0.01))
	
	func getLocations(for locationManager: LocationManager) {
        CloudKitManager.shared.getLocations { result in
			DispatchQueue.main.async { [self] in
				switch result {
                case let .success(locations):
                    locationManager.locations = locations
                    case .failure:
                        alertItem = AlertContext.unableToGetLocations
				}
			}
		}
	}
    
    func getCheckInCounts() {
        CloudKitManager.shared.getCheckedInProfilesCount { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let checkedInProfiles):
                    self.checkedInProfiles = checkedInProfiles
                case .failure:
                    break
                }
            }
        }
    }
}

