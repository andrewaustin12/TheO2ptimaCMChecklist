//
//  BuildSummaryView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct BuildSummaryView: View {
    @ObservedObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if appViewModel.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All steps complete!")
                        .padding(.top)
                        .padding(.bottom)

                    VStack {
                        Text("Summary of Build")
                            .font(.largeTitle)
                        
                        List {
                            Text("You have \(appViewModel.buildView4ViewModel.isUsedSorbMin) min left on your scrubber.")
                            Text("You have \(appViewModel.buildView8ViewModel.oxygenPressure) Bar of O2 for the dive.")
                                
                                SummaryGasCard(title: "Gas Content",
                                               o2Content: appViewModel.buildView2ViewModel.o2Content,
                                               bailoutOneDilContent: appViewModel.buildView2ViewModel.bailoutOneDilContent,
                                               bailoutTwoContent: appViewModel.buildView2ViewModel.bailoutTwoContent
                                )
                                SummaryCellAirReading(title: "mV Reading w/ Air",
                                                      cell1: appViewModel.buildView3ViewModel.cellOneAir,
                                                      cell2: appViewModel.buildView3ViewModel.cellTwoAir,
                                                      cell3: appViewModel.buildView3ViewModel.cellThreeAir
                                )
                                SummaryVoltageCard(title: "Voltage",
                                                   extVoltage: appViewModel.buildView3ViewModel.extVoltage,
                                                   intVoltage: appViewModel.buildView3ViewModel.intVoltage
                                )
                                SummaryCellO2Card(title: "mV Reading w/ Oxygen",
                                                  cell1: appViewModel.buildView5ViewModel.cellOneO2,
                                                  cell2: appViewModel.buildView5ViewModel.cellTwoO2,
                                                  cell3: appViewModel.buildView5ViewModel.cellThreeO2
                                )
                
                        }
                    }

                

                } else {
                    Text("Some steps are not completed:")
                        .font(.title)
                        .bold()

                    ScrollView {
                        Section {
                            ForEach(appViewModel.incompleteSteps, id: \.self) { step in
                                SummaryCard(isComplete: false, step: "Step \(step)")
                            }
                        }
                    }
                
                }
            }
            .padding(.bottom)

            NavigationLink("Finish") {
                MainTabView()
            }
            .font(.title)
            .bold()
            .buttonStyle(StandardButtonStyle())
            .disabled(!appViewModel.areAllStepsCompleted)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
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
    BuildSummaryView(appViewModel: AppViewModel())
}
