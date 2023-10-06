//
//  VoltageCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct VoltageCard: View {
    
    @ObservedObject var appViewModel: AppViewModel

    var body: some View {
        VStack {
            Text("Check Voltage:")
                .font(.title3)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                Spacer()
                VStack {
                    Text("Ext.")

                    TextField("V", text: $appViewModel.buildView3ViewModel.extVoltage)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("min 7.6V")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Text("Int.")
                    
                    TextField("V", text: $appViewModel.buildView3ViewModel.intVoltage)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("min depends on battery")
                        .font(.caption)
                }
                Spacer()
            }

        }
    }
}
#Preview {
    VoltageCard(appViewModel: AppViewModel())
}
