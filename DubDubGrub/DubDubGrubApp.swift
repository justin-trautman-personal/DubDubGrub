//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 4/22/22.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
	
	let locationManager = LocationManager()
	
    var body: some Scene {
        WindowGroup {
			AppTabView().environmentObject(locationManager)
        }
    }
}
