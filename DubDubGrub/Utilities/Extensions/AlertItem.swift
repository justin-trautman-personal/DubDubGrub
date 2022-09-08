//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/4/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    // MARK: - MapView Errors
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                                message: Text("Unable to retrieve locations at this time.\nPlease try again."),
                                                dismissButton: .default(Text("OK")))
    
    static let locationRestricted = AlertItem(title: Text("Location Restricted"),
                                              message: Text("Your location is restricted. This may be due to parental controls."),
                                              dismissButton: .default(Text("OK")))
    
    static let locationDenied = AlertItem(title: Text("Location Denied"),
                                          message: Text("Dub Dub Grub does not have permission to access your location. To change that go to your phones's Settings > Dub Dub Grub > Location."),
                                          dismissButton: .default(Text("OK")))
    
    static let locationDisabled = AlertItem(title: Text("Locations Service Disabled"),
                                            message: Text("Your phone's location services are disabled. To change that go to your phones's Settings > Privacu > Location Services."),
                                            dismissButton: .default(Text("OK")))
    
    // MARK: - ProfileView Errors
    static let invalidProfile = AlertItem(title: Text("Invalid Profile"),
                                          message: Text("All fields are required as well as profile photo. Your bio must be less than 100 characters. Please try again."),
                                          dismissButton: .default(Text("OK")))
    
    static let noUserRecord = AlertItem(title: Text("No User Record"),
                                        message: Text("You must log into iCloud on your phone in order to utilize DubDubGrub's Profile. Please log in from Settings."),
                                        dismissButton: .default(Text("OK")))
    
    static let createProfileSuccess = AlertItem(title: Text("Profile Created Successfully!"),
                                                message: Text("Your profile has successfully been created."),
                                                dismissButton: .default(Text("OK")))
    
    static let createProfileFailure = AlertItem(title: Text("Failed to create profile"),
                                                message: Text("We were unable to create your profile at this time."),
                                                dismissButton: .default(Text("OK")))
    
    static let unableToGetProfile = AlertItem(title: Text("Unable to retrieve profile"),
                                              message: Text("We were unable to retrieve your profile at this time."),
                                              dismissButton: .default(Text("OK")))
    
    static let updateProfileSuccess = AlertItem(title: Text("Profile Update Success!"),
                                                message: Text("Your DubDubGrub profile was updated successfully."),
                                                dismissButton: .default(Text("OK")))
    
    static let updateProfileFailure = AlertItem(title: Text("Profile Update Failed"),
                                                message: Text("We were unable to update your profile at this time."),
                                                dismissButton: .default(Text("OK")))
    
    // MARK: - LocationDetailView Errors
    static let invalidPhoneNumber = AlertItem(title: Text("Invalid Phone Number"),
                                              message: Text("The phone number for the location is invalid. Please look up the phone number yourself."),
                                              dismissButton: .default(Text("OK")))
    
    static let unableToGetCheckInStatus = AlertItem(title: Text("Server Error"),
                                                    message: Text("Unable to retrieve checked in status of the current user.\nPlease try again."),
                                                    dismissButton: .default(Text("OK")))
    
    static let unableToGetCheckInOrOut = AlertItem(title: Text("Server Error"),
                                                   message: Text("Unable to check in/out at this time.\nPlease try again."),
                                                   dismissButton: .default(Text("OK")))
    
    static let unableToGetCheckedInProfiles = AlertItem(title: Text("Server Error"),
                                                       message: Text("Unable to get users checked in to this location at this time.\nPlease try again."),
                                                       dismissButton: .default(Text("OK")))
}
