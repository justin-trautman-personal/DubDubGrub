//
//  ProfileViewModel.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/5/22.
//

import CloudKit

final class ProfileViewModel: ObservableObject {
	
	@Published var firstName 			 = ""
	@Published var lastName 	 		 = ""
	@Published var companyName 		 = ""
	@Published var bio 	     		 = ""
	@Published var avatar		 		 = PlaceholderImage.avatar
	@Published var isShowingPhotoPicker = false
	@Published var alertItem: AlertItem?
	
	func isValidProfile() -> Bool {
		guard !firstName.isEmpty,
			  !lastName.isEmpty,
			  !companyName.isEmpty,
			  !bio.isEmpty,
			  avatar != PlaceholderImage.avatar,
			  bio.count < 100
		else { return false }
		
		return true
	}
	
	func getProfile() {
		CKContainer.default().fetchUserRecordID { recordId, error in
			guard let recordId = recordId, error == nil else {
				print(error?.localizedDescription ?? "")
				return
			}
			
			CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordId) { userRecord, error in
				guard let userRecord = userRecord, error == nil else {
					print(error?.localizedDescription ?? "")
					return
				}
				
				let profileReference = userRecord["userProfile"] as! CKRecord.Reference
				let profileRecordID  = profileReference.recordID
				
				CKContainer.default().publicCloudDatabase.fetch(withRecordID: profileRecordID) { profileRecord, error in
					guard let profileRecord = profileRecord, error == nil else {
						print(error?.localizedDescription ?? "")
						return
					}
					
					DispatchQueue.main.async { [self] in
						let profile = DDGProfile(record: profileRecord)
						firstName   = profile.firstName
						lastName    = profile.lastName
						companyName = profile.companyName
						bio 		= profile.bio
						avatar 		= profile.createAvatarImage()
					}
				}
			}
		}
	}
	
	func createProfile() {
		guard isValidProfile() else {
			alertItem = AlertContext.invalidProfile
			return
		}
		
		let profileRecord = CKRecord(recordType: RecordType.profile)
		profileRecord[DDGProfile.kFirstName]   = firstName
		profileRecord[DDGProfile.kLastName]    = lastName
		profileRecord[DDGProfile.kCompanyName] = companyName
		profileRecord[DDGProfile.kBio]  		 = bio
		profileRecord[DDGProfile.kAvatar]       = avatar.convertToCKAsset()
		
		CKContainer.default().fetchUserRecordID { recordId, error in
			guard let recordId = recordId, error == nil else {
				print(error?.localizedDescription ?? "")
				return
			}
			
			CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordId) { userRecord, error in
				guard let userRecord = userRecord, error == nil else {
					print(error?.localizedDescription ?? "")
					return
				}
				
				userRecord["userProfile"] = CKRecord.Reference(recordID: profileRecord.recordID, action: .none)
				
				let operation = CKModifyRecordsOperation(recordsToSave: [userRecord, profileRecord])
				
				operation.modifyRecordsCompletionBlock = { savedRecords, _, error in
					guard let savedRecords = savedRecords, error == nil else {
						print(error?.localizedDescription ?? "")
						return
					}
					
					print(savedRecords)
				}
				
				CKContainer.default().publicCloudDatabase.add(operation)
			}
		}
	}
}
