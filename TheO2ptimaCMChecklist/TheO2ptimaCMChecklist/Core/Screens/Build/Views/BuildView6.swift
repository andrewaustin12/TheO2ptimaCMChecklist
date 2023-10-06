//
//  BuildView6.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView6: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 4))
                    .padding(.leading)
                
                Form {
                    
                    Section {
                        Toggle("Install both water trap tubes into counterlungs.", isOn: $appViewModel.buildView6ViewModel.isWaterTrapInstalledOnCounterlungsChecked)
                        Text("Note: \nThe black machined tube is for the exhale side.")
                            .font(.caption)
                    } header: {
                        Text("Step 16")
                    }
                    Section {
                        Toggle("Set the assembled scrubber canister into place and install onto counterlungs. ", isOn: $appViewModel.buildView6ViewModel.isCanisterInstalledOntoCounterLungs)
                        
                        Toggle("Inspect DSV, mushroom valves, mouthpiece, loop hoses, fittings, and O-rings. ", isOn: $appViewModel.buildView6ViewModel.isUnitPiecesInspectedChecked)
                        
                        Toggle("Connect DSV to loop hoses and perform stereo check to confirm flow direction.", isOn: $appViewModel.buildView6ViewModel.isLoopConnectedTestedDirectionChecked)
                        
                        Toggle("Connect loop hoses to counterlungs. Double check all loop fittings for tightness. ", isOn: $appViewModel.buildView6ViewModel.isLoopHosesConnectedCounterlungsChecked)
                        
                        Toggle("Route controller and HUD cables. Plug into electronics canisters and stow excess in counterlung pockets. ", isOn: $appViewModel.buildView6ViewModel.isCablesStowedChecked)

                    } header: {
                        Text("Step 17 - 21")
                    }
                    
                    


                }
            }
            NavigationLink("Next") {
                BuildView7(appViewModel: appViewModel)
            }
            .font(.title)
            .bold()
        }
    }
}

#Preview {
    BuildView6(appViewModel: AppViewModel())
}
