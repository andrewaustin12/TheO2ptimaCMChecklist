//
//  BuildHistoryData.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 4/8/24.
//

import SwiftUI

struct BuildHistoryData: View {
    
    // Use @AppStorage to save and load the expiration dates
    @State private var cell1ExpirationDate = UserDefaults.standard.object(forKey: "$cell1ExpirationDate") as? Date ?? Date()
    @State private var cell2ExpirationDate = UserDefaults.standard.object(forKey: "$cell2ExpirationDate") as? Date ?? Date()
    @State private var cell3ExpirationDate = UserDefaults.standard.object(forKey: "$cell3ExpirationDate") as? Date ?? Date()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BuildHistoryData()
}
