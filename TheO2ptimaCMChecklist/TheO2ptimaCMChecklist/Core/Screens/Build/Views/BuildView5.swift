//
//  BuildView5.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView5: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 3))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Inspect bore plug and confirm that it is installed in correct orientation. ", isOn: $appViewModel.buildView5ViewModel.isBorePlugChecked)
                        
                        Toggle("Lube head O-rings and flat seal as necessary. Confirm O-ring is in place on premix tube and install head onto canister. ", isOn: $appViewModel.buildView5ViewModel.isLubedHeadInstalledChecked)
                        
                        Toggle("Confirm water trap is installed in lid. Lube lid O-rings and flat seal as necessary. Install lid onto canister.", isOn: $appViewModel.buildView5ViewModel.isWaterTrapInstalledChecked)
                        
                        Toggle("Install calibration caps, connect O2 hose, turn on controller, and flush with oxygen until PP02 readings stabilize.", isOn: $appViewModel.buildView5ViewModel.isO2FlushedChecked)
                        
                        Toggle("Calibrate controller and HUD.", isOn: $appViewModel.buildView5ViewModel.isControllerCalibratedChecked)

                    } header: {
                        Text("Step 10 - 14")
                    }
                    
                    Section {
                        Toggle("Check and record mV readings while filled with O2:", isOn: $appViewModel.buildView5ViewModel.isMvWithO2Checked)
                        Text("Note: \nReadings should be between 50 and 62 mV (for Analytical Industries Inc. sensors).")
                            .font(.caption)
                        MillivoltReadingO2Card(appViewModel: appViewModel)
                    } header: {
                        Text("Step 15")
                    }


                }
            }
            NavigationLink("Next") {
                BuildView6(appViewModel: appViewModel)
            }
            .buttonStyle(StandardButtonStyle())
            .bold()
            .font(.title3)
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MainTabView()
                    } label: {
                        Image(systemName: "house")
                    }
                }
                
            }
        }
    }
}


#Preview {
    BuildView5(appViewModel: AppViewModel())
}
