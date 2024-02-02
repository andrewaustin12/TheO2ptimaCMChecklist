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
                        // Cell 1
                        VStack {
                            Text("Cell 1:")
                                .font(.headline)
                            Text(cellValue(build.cellOneAir))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer() // Spacers to evenly distribute the VStacks
                        
                        // Cell 2
                        VStack {
                            Text("Cell 2:")
                                .font(.headline)
                            Text(cellValue(build.cellTwoAir))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        // Cell 3
                        VStack {
                            Text("Cell 3:")
                                .font(.headline)
                            Text(cellValue(build.cellThreeAir))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Section("Cells @ O2") {
                    HStack {
                        VStack {
                            Text("Cell 1:")
                                .font(.headline)
                            Text(cellValue(build.cellOneO2))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer() // Spacers to evenly distribute the VStacks
                        
                        VStack {
                            Text("Cell 2:")
                                .font(.headline)
                            Text(cellValue(build.cellTwoO2))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Text("Cell 3:")
                                .font(.headline)
                            Text(cellValue(build.cellThreeO2))
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
                            Text("Bail/Dil:")
                                .font(.headline)
                            Text(formatGasMixture(build.bailoutOneDilContent))
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        // Show Bailout/Diluent 2 if it's not an empty string
                        if !build.bailoutTwoContent.isEmpty {
                            Spacer()
                            
                            VStack {
                                Text("Bail/Dil 2:")
                                    .font(.headline)
                                Text(formatGasMixture(build.bailoutTwoContent))
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
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
            .listStyle(.plain)
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
    
    // Helper function to format the cell value
    private func cellValue(_ value: Double?) -> String {
        if let unwrappedValue = value {
            return String(format: "%.2f mV", unwrappedValue)
        } else {
            return "N/A" // or any default value you prefer
        }
    }
    
    
}


#Preview {
    BuildLogDetailView(build: Build(), buildNumber: 1)
        .modelContainer(for: Build.self)
}

