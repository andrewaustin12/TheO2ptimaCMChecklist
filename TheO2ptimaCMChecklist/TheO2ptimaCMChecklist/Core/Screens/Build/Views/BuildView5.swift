//
//  BuildView5.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView5: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 3))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Inspect bore plug and confirm that it is installed in correct orientation. ", isOn: $build.isBorePlugChecked)
                        
                        Toggle("Lube head O-rings and flat seal as necessary. Confirm O-ring is in place on premix tube and install head onto canister. ", isOn: $build.isLubedHeadInstalledChecked)
                        
                        Toggle("Confirm water trap is installed in lid. Lube lid O-rings and flat seal as necessary. Install lid onto canister.", isOn: $build.isWaterTrapInstalledChecked)
                        
                        Toggle("Install calibration caps, connect O2 hose, turn on controller, and flush with oxygen until PP02 readings stabilize.", isOn: $build.isO2FlushedChecked)
                        
                        Toggle("Calibrate controller and HUD.", isOn: $build.isControllerCalibratedChecked)

                    } header: {
                        Text("Step 10 - 14")
                    }
                    
                    Section {
                        Toggle("Check and record mV readings while filled with O2:", isOn: $build.isMvWithO2Checked)
                        Text("Note: \nReadings should be between 50 and 62 mV (for Analytical Industries Inc. sensors).")
                            .font(.caption)
                        MillivoltReadingO2Card(build: build)
                    } header: {
                        Text("Step 15")
                    }


                }
            }
            NavigationLink("Next") {
                BuildView6(build: build)
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
    NavigationStack {
        BuildView5(build: Build())
            .modelContainer(for: Build.self)
    }
}
