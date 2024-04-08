//
//  OxygenPressureCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct OxygenPressureCard: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    @AppStorage("isBarPsiChecked") private var isBarPsiChecked = false // Assuming false is for BAR, true for PSI

    //@ObservedObject var appViewModel: AppViewModel

    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("Pressure:")
                    Spacer()
                    TextField(isBarPsiChecked ? "PSI" : "BAR", text: $build.oxygenPressure)
                        .keyboardType(.numbersAndPunctuation)
                        .submitLabel(.done)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
    }
}
#Preview {
    OxygenPressureCard(build: Build())
        .modelContainer(for: Build.self)
}
