//
//  ScrubberStatusCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct ScrubberStatusCard: View {
    
    @ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case eac, sorb, isUsedSorbMin
    }
    
    var body: some View {
        VStack {
            
            VStack {

                HStack {
                    Spacer()
                    VStack {
                        Text("EAC")
                        
                        TextField("yes/no", text: $appViewModel.buildView4ViewModel.eac)
                            .focused($focusedTextField, equals: .eac)
                            .onSubmit {focusedTextField = .sorb}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Spacer()
                    VStack {
                        Text("Sorb")
                        
                        TextField("type", text: $appViewModel.buildView4ViewModel.sorb)
                            .focused($focusedTextField, equals: .sorb)
                            .onSubmit {focusedTextField = .isUsedSorbMin}
                            .submitLabel(.next)
                            .keyboardType(.numbersAndPunctuation)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Spacer()
                    VStack{
                        Text("Min Left")
                        TextField("Min", text: $appViewModel.buildView4ViewModel.isUsedSorbMin)
                            .focused($focusedTextField, equals: .isUsedSorbMin)
                            .onSubmit {focusedTextField = nil}
                            .submitLabel(.done)
                            .keyboardType(.numbersAndPunctuation)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        
                        Toggle("New", isOn: $appViewModel.buildView4ViewModel.isNewSorb)
                        Toggle("Used", isOn: $appViewModel.buildView4ViewModel.isUsedSorb)
                    }
                    Spacer()
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ScrubberStatusCard(appViewModel: AppViewModel())
}
