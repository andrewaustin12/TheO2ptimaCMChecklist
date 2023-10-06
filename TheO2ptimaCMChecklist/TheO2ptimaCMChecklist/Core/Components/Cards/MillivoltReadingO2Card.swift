//
//  MillivoltCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct MillivoltReadingO2Card: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Record mV Readings w/ Oxygen:")
                .font(.title3)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                VStack {
                    Text("Cell 1")
                    
                    TextField("mV", text: $appViewModel.buildView5ViewModel.cellOneO2)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("Cell 2")
                    
                    TextField("mV", text: $appViewModel.buildView5ViewModel.cellTwoO2)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("Cell 3")
                    
                    TextField("mV", text: $appViewModel.buildView5ViewModel.cellThreeO2)
                        .keyboardType(.decimalPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
            }
            .padding()
            
            VStack{
                Text("Check for stability.")
                    .font(.callout)
            }
        }
    }
}

#Preview {
    MillivoltReadingO2Card(appViewModel: AppViewModel())
}
