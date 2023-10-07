//
//  MillivoltCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct MillivoltReadingO2Card: View {
    
    @ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case cellOneO2, cellTwoO2, cellThreeO2
    }
    
    var body: some View {
        VStack {
            Text("Record mV Readings w/ Oxygen:")
                .font(.title3)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                VStack {
                    Text("Cell 1")
                    
                    TextField("mV", text: $appViewModel.buildView5ViewModel.cellOneO2)
                        .focused($focusedTextField, equals: .cellOneO2)
                        .onSubmit {focusedTextField = .cellTwoO2}
                        .submitLabel(.next)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("Cell 2")
                    
                    TextField("mV", text: $appViewModel.buildView5ViewModel.cellTwoO2)
                        .focused($focusedTextField, equals: .cellTwoO2)
                        .onSubmit {focusedTextField = .cellThreeO2}
                        .submitLabel(.next)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("Cell 3")
                    
                    TextField("mV", text: $appViewModel.buildView5ViewModel.cellThreeO2)
                        .focused($focusedTextField, equals: .cellThreeO2)
                        .onSubmit {focusedTextField = nil}
                        .submitLabel(.done)
                        .keyboardType(.numbersAndPunctuation)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
            }
            .padding()
            
            VStack{
                Text("Check for stability.")
                    .font(.callout)
            }
        }
    }
}

#Preview {
    MillivoltReadingO2Card(appViewModel: AppViewModel())
}
