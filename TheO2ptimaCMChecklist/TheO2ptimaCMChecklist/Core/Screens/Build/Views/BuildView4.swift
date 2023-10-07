//
//  BuildView4.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct BuildView4: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on HUD. Check operation, ensure that all LEDs are functional, and confirm orientation.", isOn: $appViewModel.buildView4ViewModel.isHudFunctioningChecked)
                        
                        Toggle("Inspect canister, head, and lid for damage or debris. ", isOn: $appViewModel.buildView4ViewModel.isCanisterHeadLidChecked)

                    } header: {
                        Text("Step 6 - 7")
                    }
                    
                    Section {
                        Toggle("Is Scrubber", isOn: $appViewModel.buildView4ViewModel.isScrubberStatusChecked)
                        ScrubberStatusCard(appViewModel: appViewModel)
                        
                    } header: {
                        Text("Step 8")
                    }
                    
                    Section {
                        Toggle("Pack scrubber canister.  ", isOn: $appViewModel.buildView4ViewModel.isScrubberPackedChecked)
                        Text("Note: \nIf using EAC, inspect cartridge for damage, mark/note cartridge direction and install cartridge.")
                            .font(.caption)
                    } header: {
                        Text("Step 9")
                    }



                }
            }
            NavigationLink("Next") {
                BuildView5(appViewModel: appViewModel)
            }
            .buttonStyle(StandardButtonStyle())
            .bold()
            .font(.title3)
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
    BuildView4(appViewModel: AppViewModel())
}
