//
//  View+Ext.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 4/22/22.
//

import SwiftUI

extension View {
	func profileNameStyle() -> some View {
		modifier(ProfileNameStyle())
	}
	
	func dismissKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
