//
//  BuildView6.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView6: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 4))
                    .padding(.leading)
                
                Form {
                    
                    Section {
                        Toggle("Install both water trap tubes into counterlungs.", isOn: $build.isWaterTrapInstalledOnCounterlungsChecked)
                        Text("Note: \nThe black machined tube is for the exhale side.")
                            .font(.caption)
                            .foregroundStyle(.unitPrimary)
                    } header: {
                        Text("Step 16")
                    }
                    Section {
                        Toggle("Set the assembled scrubber canister into place and install onto counterlungs. ", isOn: $build.isCanisterInstalledOntoCounterLungs)
                        
                        Toggle("Inspect DSV, mushroom valves, mouthpiece, loop hoses, fittings, and O-rings. ", isOn: $build.isUnitPiecesInspectedChecked)
                        
                        Toggle("Connect DSV to loop hoses and perform stereo check to confirm flow direction.", isOn: $build.isLoopConnectedTestedDirectionChecked)
                        
                        Toggle("Connect loop hoses to counterlungs. Double check all loop fittings for tightness. ", isOn: $build.isLoopHosesConnectedCounterlungsChecked)
                        
                        Toggle("Route controller and HUD cables. Plug into electronics canisters and stow excess in counterlung pockets. ", isOn: $build.isCablesStowedChecked)

                    } header: {
                        Text("Step 17 - 21")
                    }
                    
                    


                }
            }
            NavigationLink("Next") {
                BuildView7(build: build)
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
        BuildView6(build: Build())
            .modelContainer(for: Build.self)
    }
}
