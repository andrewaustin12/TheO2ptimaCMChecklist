//
//  MillivoltCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

// Assuming SwiftData is your project's custom way to handle data
struct MvReadingO2Card: View {
    @Binding var build: Build // Assume Build is a part of your data model
    @Environment(\.modelContext) var modelContext
    
    // Temporary state properties for user input as strings
    @State private var cellOneO2Input = ""
    @State private var cellTwoO2Input = ""
    @State private var cellThreeO2Input = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Record mV Readings w/ O2:")
                .font(.title3)
                .padding(.bottom, 1)
            
            HStack {
                VStack {
                    Text("Cell 1")
                    TextField("mV", text: $cellOneO2Input)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: cellOneO2Input) { newValue in
                            build.cellOneO2 = Double(newValue) ?? 0
                        }
                }
                
                Spacer() // To evenly space the TextFields
                
                VStack {
                    Text("Cell 2")
                    TextField("mV", text: $cellTwoO2Input)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: cellTwoO2Input) { newValue in
                            build.cellTwoO2 = Double(newValue) ?? 0
                        }
                }
                
                Spacer()
                
                VStack {
                    Text("Cell 3")
                    TextField("mV", text: $cellThreeO2Input)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: cellThreeO2Input) { newValue in
                            build.cellThreeO2 = Double(newValue) ?? 0
                        }
                }
            }.padding()
        }
        .onAppear {
            // Initialize the text fields with existing values if they are not 0
            cellOneO2Input = build.cellOneO2 != 0 ? String(build.cellOneO2) : ""
            cellTwoO2Input = build.cellTwoO2 != 0 ? String(build.cellTwoO2) : ""
            cellThreeO2Input = build.cellThreeO2 != 0 ? String(build.cellThreeO2) : ""
        }
    }
}

// Extension to format the number in the TextField
extension NumberFormatter {
    static let twoDecimalPlaces: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

// Placeholder extension for Views to conditionally show placeholder content
extension View {
    @ViewBuilder
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                if shouldShow { placeholder() }
                self
            }
    }
}

// Preview provider for SwiftUI previews in Xcode
struct MvReadingO2Card_Previews: PreviewProvider {
    static var previews: some View {
        // Example usage in a preview with a dummy Build object
        MvReadingO2Card(build: .constant(Build()))
    }
}
