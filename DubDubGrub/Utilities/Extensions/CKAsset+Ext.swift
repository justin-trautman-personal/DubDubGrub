//
//  CKAsset+Ext.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/4/22.
//

import CloudKit
import UIKit

extension CKAsset {
	func convertToUIImage(in dimension: ImageDimension) -> UIImage {
		let placeholder = ImageDimension.getPlaceholder(for: dimension)
		
		guard let fileUrl = fileURL else { return placeholder }
		
		do {
			let data = try Data(contentsOf: fileUrl)
			return UIImage(data: data) ?? placeholder
		} catch {
			return placeholder
		}
	}
}
