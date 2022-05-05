//
//  CKRecord+Ext.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/4/22.
//

import CloudKit

extension CKRecord {
	
	func convertToDDGLocation() -> DDGLocation { DDGLocation(record: self) }
	func convertToDDGProfile() -> DDGProfile { DDGProfile(record: self) }
}
