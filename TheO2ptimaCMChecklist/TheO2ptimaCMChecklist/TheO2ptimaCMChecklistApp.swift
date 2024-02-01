//
//  TheO2ptimaCMChecklistApp.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/4/23.
//

import SwiftUI
import StoreKit
import SwiftData

@main
struct TheO2ptimaCMChecklistApp: App {
    
    @StateObject private var store = TipStore()
    
    var body: some Scene {
        WindowGroup {
            WarningView()
                .environmentObject(store)
        }
    }
}
