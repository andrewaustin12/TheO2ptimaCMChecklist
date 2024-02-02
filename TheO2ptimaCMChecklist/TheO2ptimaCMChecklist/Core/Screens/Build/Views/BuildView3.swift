//
//  BuildView3.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI
import SwiftData

struct BuildView3: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 1))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on handset and check O2 sensor display in ambient air.", isOn: $build.o2SensorsChecked)
                        Text("Note: \nReadings should be between 10 and 14 mV \n(for Analytical Industries Inc. sensors).")
                            .font(.caption)
                            .foregroundStyle(.unitPrimary)
                        MvReadingAmbientAirCard(build: $build)
                    } header: {
                        Text("Step 4")
                    }
                    
                    Section {
                        Toggle("Change to low setpoint to fire O2 solenoid.", isOn: $build.isSetPointChanged)
                        VoltageCard(build: build)
                        Toggle("Change setpoint back to .19", isOn: $build.isSetPointTo19)
                    } header: {
                        Text("Step 5")
                    }


                }
            }
            NavigationLink("Next") {
                BuildView4(build: build)
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
        BuildView3(build: Build())
            .modelContainer(for: Build.self)
    }
}
