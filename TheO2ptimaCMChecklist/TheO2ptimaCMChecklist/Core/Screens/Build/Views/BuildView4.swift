//
//  BuildView4.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct BuildView4: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on HUD. Check operation, ensure that all LEDs are functional, and confirm orientation.", isOn: $build.isHudFunctioningChecked)
                        
                        Toggle("Inspect canister, head, and lid for damage or debris. ", isOn: $build.isCanisterHeadLidChecked)

                    } header: {
                        Text("Step 6 - 7")
                    }
                    
                    Section {
                        Toggle("Is Scrubber", isOn: $build.isScrubberStatusChecked)
                        ScrubberStatusCard(build: build)
                        
                    } header: {
                        Text("Step 8")
                    }
                    
                    Section {
                        Toggle("Pack scrubber canister", isOn: $build.isScrubberPackedChecked)
                        Text("Note: \nIf using EAC, inspect cartridge for damage, mark/note cartridge direction and install cartridge.")
                            .font(.caption)
                            .foregroundStyle(.unitPrimary)
                    } header: {
                        Text("Step 9")
                    }



                }
            }
            NavigationLink("Next") {
                BuildView5(build: build)
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
        BuildView4(build: Build())
            .modelContainer(for: Build.self)
    }
}
