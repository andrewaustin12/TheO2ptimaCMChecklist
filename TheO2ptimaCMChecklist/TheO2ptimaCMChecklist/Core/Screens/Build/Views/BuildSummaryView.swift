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
