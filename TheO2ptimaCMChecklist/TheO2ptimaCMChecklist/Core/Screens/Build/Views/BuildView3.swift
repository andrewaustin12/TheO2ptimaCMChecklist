//
//  BuildView3.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct BuildView3: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 1))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on handset and check O2 sensor display in ambient air.", isOn: $appViewModel.buildView3ViewModel.o2SensorsChecked)
                        Text("Note: \nReadings should be between 10 and 14 mV \n(for Analytical Industries Inc. sensors).")
                            .font(.caption)
                        MvReadingAmbientAirCard(appViewModel: AppViewModel())
                    } header: {
                        Text("Step 4")
                    }
                    
                    Section {
                        Toggle("Change to low setpoint to fire O2 solenoid.", isOn: $appViewModel.buildView3ViewModel.isSetPointChanged)
                        VoltageCard(appViewModel: AppViewModel() )
                        Toggle("Change setpoint back to .19", isOn: $appViewModel.buildView3ViewModel.isSetPointTo19)
                    } header: {
                        Text("Step 5")
                    }


                }
            }
            NavigationLink("Next") {
                BuildView4(appViewModel: appViewModel)
            }
            .font(.title)
            .bold()
        }
    }
}

#Preview {
 
    BuildView3(appViewModel: AppViewModel())
}
