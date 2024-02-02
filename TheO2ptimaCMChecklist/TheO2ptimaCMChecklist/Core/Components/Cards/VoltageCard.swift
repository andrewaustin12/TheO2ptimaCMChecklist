//
//  VoltageCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct VoltageCard: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    //@ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case  extVoltage, intVoltage
    }

    var body: some View {
        VStack {
            Text("Check Voltage:")
                .font(.title3)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                Spacer()
                VStack {
                    Text("Ext.")

                    TextField("V", text: $build.extVoltage)
                        .focused($focusedTextField, equals: .extVoltage)
                        .onSubmit {focusedTextField = .intVoltage}
                        .submitLabel(.next)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("min 7.6V")
                        .font(.caption)
                        .foregroundStyle(.unitPrimary)
                }
                Spacer()
                VStack {
                    Text("Int.")
                    
                    TextField("V", text: $build.intVoltage)
                        .focused($focusedTextField, equals: .intVoltage)
                        .onSubmit {focusedTextField = nil}
                        .submitLabel(.done)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("min depends on battery")
                        .font(.caption)
                        .foregroundStyle(.unitPrimary)
                }
                Spacer()
            }

        }
    }
}
#Preview {
    
    VoltageCard(build: Build())
        .modelContainer(for: Build.self)
}
