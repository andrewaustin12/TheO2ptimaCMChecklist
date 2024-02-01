//
//  BuildView9.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView9: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 7))
                    .padding(.leading)
                
                Form {
                    
                    Section {
                        Toggle("Confirm correct onboard & bailout gases are configured and selected in computers and that they are set to CC mode.", isOn: $build.isGasesComputerConfiguredChecked)
                        Toggle("Check bailout regulator hoses, mouthpieces, and hose fitting tightness. Install bailout regulators.", isOn: $build.isRegulatorsHosesInstalledTight)
                    } header: {
                        Text("Step 29 - 30")
                    }
                }
            }
            NavigationLink("Next") {
                BuildSummaryView(build: build)
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
        BuildView9(build: Build())
            .modelContainer(for: Build.self)
    }
}
