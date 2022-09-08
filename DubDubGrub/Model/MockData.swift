//
//  MockData.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/3/22.
//

import CloudKit

struct MockData {
	
	static var location: CKRecord {
		let record 				         = CKRecord(recordType: RecordType.location)
		record[DDGLocation.kName]		 = "Sean's Bar and Grill"
		record[DDGLocation.kAddress] 	 = "123 Main Street"
		record[DDGLocation.kDescription] = """
											This is a test description. Isn't it awesome, not sure how long to make it to test the three lines?
											Maybe we should add some more to be safe.
											"""
		record[DDGLocation.kWebsiteURL]  = "https://apple.come"
		record[DDGLocation.kLocation]    = CLLocation(latitude: 37.331516, longitude: -121.891054)
		record[DDGLocation.kPhoneNumber] = "509-505-8245"
		
		return record
	}
    
    static var profile: CKRecord {
        let record                      = CKRecord(recordType: RecordType.profile)
        record[DDGProfile.kFirstName]   = "Test"
        record[DDGProfile.kLastName]    = "User"
        record[DDGProfile.kCompanyName] = "Best Company Ever"
        record[DDGProfile.kBio]         = "This is my bio, I hope it's not too long I can't check character count."
        
        return record
    }
}
