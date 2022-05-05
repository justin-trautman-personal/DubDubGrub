//
//  UIImage+Ext.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/5/22.
//

import CloudKit
import UIKit

extension UIImage {
	
	func convertToCKAsset() -> CKAsset? {
		
		// get our app base document directory url
		guard let urlPath = FileManager
							.default
							.urls(for: .documentDirectory, in: .userDomainMask)
							.first
		else { return nil }
		
		// append some unique id to our profile image
		let fileUrl = urlPath.appendingPathComponent("selectedAvatarImage")
		
		// write image data to the location on disk
		guard let imageData = jpegData(compressionQuality: 0.25) else { return nil }
		
		// create our CKAsset with that fileurl
		do {
			try imageData.write(to: fileUrl)
			return CKAsset(fileURL: fileUrl)
		} catch {
			return nil
		}
	}
}
