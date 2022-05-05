//
//  CloudKitManager.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/3/22.
//

import CloudKit

struct CloudKitManager {
		
	static func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
		let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
		let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
		query.sortDescriptors = [sortDescriptor]
		
		CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
			if let error = error {
				completed(.failure(error))
				return
			}
			
			guard let records = records else { return }
			
			let locations = records.map { $0.convertToDDGLocation() }
			completed(.success(locations))
		}
	}
}

