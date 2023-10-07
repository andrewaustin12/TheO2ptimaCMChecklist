//
//  OxygenPressureCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct OxygenPressureCard: View {
    
    @ObservedObject var appViewModel: AppViewModel

    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("Pressure:")
                    Spacer()
                    TextField("Bar", text: $appViewModel.buildView8ViewModel.oxygenPressure)
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
    OxygenPressureCard(appViewModel: AppViewModel())
}
