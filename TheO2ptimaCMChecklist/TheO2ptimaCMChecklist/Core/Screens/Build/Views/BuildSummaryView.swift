//
//  BuildSummaryView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildSummaryView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    //@ObservedObject var appViewModel: AppViewModelf
    @AppStorage("isBarPsiChecked") private var isBarPsiChecked = false // Assuming false is for BAR, true for PSI

    @State private var navigateToMain = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if build.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All steps complete!")
                        .padding(.top)


                    VStack {
                        Text("Summary of Build")
                            .font(.largeTitle)
                        
                        List {
                            Text("You have \(build.isUsedSorbMin) min left on your scrubber.")
                            Text("You have \(build.oxygenPressure) \(isBarPsiChecked ? "PSI" : "BAR") of O2 for the dive.")
                                
                                SummaryGasCard(title: "Gas Content",
                                               o2Content: build.o2Content,
                                               bailoutOneDilContent: build.bailoutOneDilContent,
                                               bailoutTwoContent: build.bailoutTwoContent
                                )
                                SummaryCellAirReading(title: "mV Reading w/ Air",
                                                      cell1: String(format: "%.2f", build.cellOneAir),
                                                      cell2: String(format: "%.2f", build.cellTwoAir),
                                                      cell3: String(format: "%.2f", build.cellThreeAir)
                                )
                                SummaryVoltageCard(title: "Voltage",
                                                   extVoltage: build.extVoltage,
                                                   intVoltage: build.intVoltage
                                )
                                SummaryCellO2Card(title: "mV Reading w/ Oxygen",
                                                  cell1: String(format: "%.2f", build.cellOneO2),
                                                  cell2: String(format: "%.2f", build.cellTwoO2),
                                                  cell3: String(format: "%.2f", build.cellThreeO2)
                                )
                
                        }
                    }

                

                } else {
                    Text("Some steps are not completed:")
                        .font(.title)
                        .bold()

                    ScrollView {
                        Section {
                            ForEach(build.incompleteSteps, id: \.self) { step in
                                SummaryCard(isComplete: false, step: "Step \(step)")
                            }
                        }
                    }
                
                }
            }
            .padding(.bottom)

            Button("Finish") {
                addBuildToHistory()
                navigateToMain = true // Set to navigate
            }
            .font(.title)
            .bold()
            .buttonStyle(StandardButtonStyle())
            .disabled(!build.areAllStepsCompleted)
            .foregroundColor(build.areAllStepsCompleted ? .white : .gray)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        MainTabView()
                    } label: {
                        Image(systemName: "house")
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToMain) {
                MainTabView() // Destination view
            }
        }
    }
    
    func addBuildToHistory() {
        modelContext.insert(build)
        print("Build inserted into history")
    }
}


#Preview {
    NavigationStack {
        BuildSummaryView(build: Build())
            .modelContainer(for: Build.self)
    }
}
