//
//  BuildView7.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView7: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    @State private var selectedTimeNeg = 30
    @State private var selectedTimePos = 120

    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 5))
                    .padding(.leading)
                
                Form {
                    
                    Section {
                        Toggle("Attach solenoid oxygen supply hose to fitting on head. Attach manual add feed to Oxygen MAV. ", isOn: $build.isOxygenSolenoidMAFAttachedChecked)
                        Text("Note: \nMake sure that the inline shutoff is turned on and locked open using the lock clip. ")
                            .bold()
                            .font(.caption)
                            .foregroundStyle(.unitPrimary)
                    } header: {
                        Text("Step 22")
                    }
                    Section {
                        Toggle("Clip and tighten canister cover. Mount oxygen cylinder, attach regulator, and attach oxygen hose to “Y” block. ", isOn: $build.isCanisterO2attachedToYBlock)
                        
                        Toggle("Ensure ADV is turned off and perform NEGATIVE pressure test for a minimum of 30 seconds.", isOn: $build.isNegativePressTestChecked)
                        
                       InlineTimer(selectedTime: $selectedTimeNeg)
                        
                    } header: {
                        Text("Step 23 - 24")
                    }
                    
                    Section {
                        Toggle("Ensure counterlung exhaust valve is closed and perform POSITIVE pressure test for a minimum of 2 minutes.", isOn: $build.isPostivePressTestChecked)
                        
                        InlineTimer(selectedTime: $selectedTimePos)
//                        Button {
//                            showSheet.toggle()
//                        } label: {
//                            Text("Timer")
//                                .font(.title)
//                                .frame(width: 300, height: 44)
//                                .background(.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(8)
//                        }
//                        .sheet(isPresented: $showSheet) {
//                            CountdownTimerView()
//                        }
                    } header: {
                        Text("Step 25")
                    }
                }
            }
            NavigationLink("Next") {
                BuildView8(build: build)
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
        BuildView7(build: Build())
            .modelContainer(for: Build.self)
    }
}
