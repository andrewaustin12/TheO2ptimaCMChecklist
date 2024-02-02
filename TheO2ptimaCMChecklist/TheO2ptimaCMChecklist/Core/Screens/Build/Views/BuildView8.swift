//
//  BuildView8.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildView8: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    
    @State private var selectedTimePreBreathe = 300
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 6))
                    .padding(.leading)
                
                Form {
                    
                    Section {
                        Toggle("Turn on oxygen and record oxygen cylinder pressure:", isOn: $build.isOxygenTurnedOnRecordedChecked)
                        OxygenPressureCard(build: build)
                    } header: {
                        Text("Step 26")
                    }
                    
                    Section {
                        Toggle("Turn off oxygen cylinder and perform a leak down check. ", isOn: $build.isLeakDownChecked)
                        
                    } header: {
                        Text("Steps 27")
                    }
                    
                    Section {
                        Toggle("Preform PreBreathe", isOn: $build.isPrebreatheDoneChecked)
                        Text("Turn oxygen cylinder back on")
                        Text("open counterlung exhaust valve")
                        Text("change setpoint to 0.5")
                        Text("perform a 5 minute prebreathe confirming correct solenoid operation")
                        
                        InlineTimer(selectedTime: $selectedTimePreBreathe)
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
                        Text("Step 28")
                    }
                }
            }
            NavigationLink("Next") {
                BuildView9(build: build)
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
        BuildView8(build: Build())
            .modelContainer(for: Build.self)
    }
}
