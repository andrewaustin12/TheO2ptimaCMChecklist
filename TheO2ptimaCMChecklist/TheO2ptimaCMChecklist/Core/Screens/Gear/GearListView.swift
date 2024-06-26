//
//  GearListView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 5/8/24.
//

import SwiftUI
import SwiftData

struct GearListView: View {
    @State private var sheetIsPresented = false
    @Query var toDos: [ToDo]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                
                List {
                    Section {
                        ForEach(toDos) { toDo in
                            HStack {
                                Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                    .onTapGesture {
                                        toDo.isCompleted.toggle()
                                    }
                                
                                NavigationLink {
                                    DetailView(toDo: toDo)
                                } label: {
                                    if toDo.notes.isEmpty {
                                        Text(toDo.item)
                                    } else {
                                        VStack(alignment: .leading) {
                                            Text(toDo.item)
                                            Text(toDo.notes)
                                                .font(.caption)
                                        }
                                    }
                                    
                                }
                            }
                            .font(.title2)
                            .swipeActions{
                                Button("Delete", role: .destructive) {
                                    modelContext.delete(toDo)
                                }
                            }
                        }
                    } header: {
                        Text("Gear List")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.unitPrimary)
                    }
                    
                }
                
                Button {
                    sheetIsPresented.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.unitPrimary)
                        .accentColor(.white)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                .clipShape(Circle())
                .padding()
                .sheet(isPresented: $sheetIsPresented) {
                    NavigationStack {
                        DetailView(toDo: ToDo()) // new value
                    }
                }
                
            }
            .overlay {
                if toDos.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Gear", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding items to see your list.")
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    GearListView()
}
