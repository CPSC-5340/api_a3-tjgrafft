//
// Assignment3App.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

@main
struct MLBApp: App {
    @StateObject private var dataProvider = MLBViewModel()
    
    var body: some Scene {
        WindowGroup {
            PlayerListView()
                .environmentObject(dataProvider)
        }
    }
}
