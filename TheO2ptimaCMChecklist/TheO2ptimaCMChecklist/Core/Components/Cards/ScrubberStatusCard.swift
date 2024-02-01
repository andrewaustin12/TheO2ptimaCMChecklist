//
//  ScrubberStatusCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct ScrubberStatusCard: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    @State private var stacktime: Bool = false
    
    //@ObservedObject var appViewModel: AppViewModel
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
                        
                        TextField("yes/no", text: $build.eac)
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
                        
                        TextField("type", text: $build.sorb)
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
                        TextField("Min", text: $build.isUsedSorbMin)
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
                        
                        Toggle("New", isOn: $build.isNewSorb)
                        Toggle("Used", isOn: $build.isUsedSorb)
                        Toggle("Rest Stack Timer", isOn: $stacktime)
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
    ScrubberStatusCard(build: Build())
}
