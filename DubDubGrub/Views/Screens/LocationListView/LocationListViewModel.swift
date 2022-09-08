//
//  LocationListViewModel.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 9/8/22.
//

import Foundation
import CloudKit

final class LocationListViewModel: ObservableObject {
    
    @Published var checkedInProfiles: [CKRecord.ID: [DDGProfile]] = [:]
    
    func getCheckedInProfilesDictionary() {
        CloudKitManager.shared.getCheckedInProfilesDictionary { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let checkedInProfiles):
                    self.checkedInProfiles = checkedInProfiles
                case .failure:
                    print("Error getting back dictionary")
                }                
            }
        }
    }
}
