//
//  MvReadingAmbientAirCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct MvReadingAmbientAirCard: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Record mV Readings w/ Air:")
                .font(.title3)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                VStack {
                    Text("Cell 1")
                    
                    TextField("mV", text: $appViewModel.buildView3ViewModel.cellOneAir)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("Cell 2")
                    
                    TextField("mV", text: $appViewModel.buildView3ViewModel.cellTwoAir)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("Cell 3")
                    
                    TextField("mV", text: $appViewModel.buildView3ViewModel.cellThreeAir)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
        }
    }
}


#Preview {
    MvReadingAmbientAirCard(appViewModel: AppViewModel())
}
