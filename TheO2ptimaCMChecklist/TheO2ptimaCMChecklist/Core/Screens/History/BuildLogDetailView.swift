//
//  BuildHistoryView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 1/12/24.
//

import SwiftUI
import SwiftData

import SwiftUI

struct BuildLogDetailView: View {
    var build: Build  // Expects a single Build object
    var buildNumber: Int
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Build Date:")
                            .font(.headline)
                        Spacer()
                        Text(build.dateAdded, format: Date.FormatStyle().month().day().year().hour().minute())
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Scrubber"){
                    HStack {
                        VStack {
                            Text("EAC:")
                                .font(.headline)
                            Text("\(build.eac)")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer() // Spacers to evenly distribute the VStacks
                        
                        VStack {
                            Text("Sorb:")
                                .font(.headline)
                            Text("\(build.sorb)")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Text("Min Left:")
                                .font(.headline)
                            Text("\(build.isUsedSorbMin)min")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("Cells @ Air") {
                    HStack {
                        VStack {
                            Text("Cell 1:")
                                .font(.headline)
                            Text("\(build.cellOneAir)mV")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer() // Spacers to evenly distribute the VStacks
                        
                        VStack {
                            Text("Cell 2:")
                                .font(.headline)
                            Text("\(build.cellTwoAir)mV")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Text("Cell 3:")
                                .font(.headline)
                            Text("\(build.cellThreeAir)mV")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack takes the full available width
                }
                
                Section("Cells @ O2") {
                    HStack {
                        VStack {
                            Text("Cell 1:")
                                .font(.headline)
                            Text("\(build.cellOneO2)mV")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer() // Spacers to evenly distribute the VStacks
                        
                        VStack {
                            Text("Cell 2:")
                                .font(.headline)
                            Text("\(build.cellTwoO2)mV")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Text("Cell 3:")
                                .font(.headline)
                            Text("\(build.cellThreeO2)mV")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack takes the full available width
                }
                
                Section("Voltage") {
                    HStack {
                        
                        VStack {
                            Text("Ext. Voltage:")
                                .font(.headline)
                            Text("\(build.extVoltage)V")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack {
                            Text("Int. Voltage:")
                                .font(.headline)
                            Text("\(build.intVoltage)V")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section("Gas Mixtures") {
                    HStack {
                        VStack {
                            Text("O2:")
                                .font(.headline)
                            Text(formatGasMixture(build.o2Content))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack {
                            Text("Bailout/Diluent:")
                                .font(.headline)
                            Text(formatGasMixture(build.bailoutOneDilContent))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section("O2 Pressure") {
                    HStack {
                        VStack {
                            Text("O2:")
                                .font(.headline)
                            Text("\(build.oxygenPressure) Bar")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Build #\(buildNumber)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private func formatGasMixture(_ mixture: String) -> String {
        // Attempt to parse the mixture string as a Double
        if let decimalValue = Double(mixture) {
            // Check if the value is less than 1, indicating a decimal that should be converted to a percentage
            if decimalValue < 1 {
                // Convert the decimal value to a percentage
                let percentageValue = decimalValue * 100
                // Determine if the result is an integer
                if floor(percentageValue) == percentageValue {
                    // Result is an integer, format as such
                    return "\(Int(percentageValue))%"
                } else {
                    // Result includes significant decimal places
                    return String(format: "%.1f%%", percentageValue)
                }
            } else {
                // Value is 1 or greater, indicating it's already a percentage
                // Check if it's an integer value
                if floor(decimalValue) == decimalValue {
                    // Value is an integer
                    return "\(Int(decimalValue))%"
                } else {
                    // Value includes significant decimal places
                    return String(format: "%.1f%%", decimalValue)
                }
            }
        } else {
            // Input is not a valid decimal number, return as is
            return mixture
        }
    }



    
}


#Preview {
    BuildLogDetailView(build: Build(), buildNumber: 1)
        .modelContainer(for: Build.self)
}

