//
//  AppTabView.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 4/22/22.
//

import SwiftUI

struct AppTabView: View {
    
    @StateObject private var viewModel = AppTabViewModel()
    
    var body: some View {
        TabView {
            LocationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            LocationListView()
                .tabItem {
                    Label("Locations", systemImage: "building")
                }
            
            NavigationView {
                ProfileView(viewModel: ProfileViewModel())
            }
            .tabItem {
                Label("Profiles", systemImage: "person")
            }
        }
        .onAppear {
            CloudKitManager.shared.getUserRecord()
            viewModel.runStartupChecks()
        }
        .accentColor(.brandPrimary)
        .sheet(isPresented: $viewModel.isShowingOnboardView, onDismiss: {
            viewModel.checkIfLocationServicesIsEnabled()
        }) {
            OnboardView(isShowingOnboardView: $viewModel.isShowingOnboardView)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
