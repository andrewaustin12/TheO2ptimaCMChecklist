//
//  BuildView2.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI
import SwiftData

struct BuildView2: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    //@ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case o2Content, bailoutOneDilContent, bailoutTwoContent
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Assembly Guide")
                
                ProgressBarView(progress: Double((350/8) * 0.1))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("If not completed before storage, Steramine and rinse canister, lid, loop hoses, DSV, and counterlungs and allow to dry.", isOn: $build.isUnitClenedBeforeDiveChecked)
                        
                        Toggle("Fill oxygen and bailout/diluent cylinders if needed. ", isOn: $build.o2BailoutDilFilledChecked)
                        
                    } header: {
                        Text("Steps 1 - 2")
                    }
                    
                    Section {
                        Text("Analyze gas for O2 and He content \n(CO analysis also recommended)")
                        VStack {
                            Text("Enter Gas content")
                                .font(.title3)
                            HStack() {
                                Text("Enter O2")
                                Spacer()
                                TextField("Mixture", text: $build.o2Content)
                                    .focused($focusedTextField, equals: .o2Content)
                                    .onSubmit {focusedTextField = .bailoutOneDilContent}
                                    .submitLabel(.next)
                                    .keyboardType(.numberPad)
                                    .frame(width: 80)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            HStack() {
                                Text("Enter Bailout/Diluent")
                                Spacer()
                                TextField("Mixture", text: $build.bailoutOneDilContent)
                                    .focused($focusedTextField, equals: .bailoutOneDilContent)
                                    .onSubmit {focusedTextField = .bailoutTwoContent }
                                    .submitLabel(.next)
                                    .keyboardType(.numbersAndPunctuation)
                                    .frame(width: 80)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            HStack() {
                                Text("Enter Bailout 2")
                                Spacer()
                                TextField("Mixture", text: $build.bailoutTwoContent)
                                    .focused($focusedTextField, equals: .bailoutTwoContent)
                                    .onSubmit {focusedTextField = nil }
                                    .submitLabel(.done)
                                    .keyboardType(.numbersAndPunctuation)
                                    .frame(width: 80)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                        
                    } header: {
                        Text("Step 3")
                    }
                }
            }
            NavigationLink("Next") {
                BuildView3(build: build)
            }
            .bold()
            .font(.title3)
            .foregroundStyle(.white)
            .buttonStyle(StandardButtonStyle())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MainTabView()
                    } label: {
                        Image(systemName: "house")
                    }
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Dismiss") { focusedTextField = nil }
                }
            }

        }
    }
}

#Preview {
    NavigationStack {
        BuildView2(build: Build())
            .modelContainer(for: Build.self)
    }
}

