//
//  BuildLogsView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 2/1/24.
//

import SwiftUI
import SwiftData
import Charts

struct BuildHistoryView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Build.dateAdded) var builds: [Build]
    @State private var sortOrder: SortOrder = .newestFirst
    @State private var selectedSection: ViewSection = .buildHistory
    
    // State variables for date selection, initialized from UserDefaults
    @State private var cell1ExpirationDate: Date = UserDefaults.standard.object(forKey: "cell1ExpirationDate") as? Date ?? Date()
    @State private var cell2ExpirationDate: Date = UserDefaults.standard.object(forKey: "cell2ExpirationDate") as? Date ?? Date()
    @State private var cell3ExpirationDate: Date = UserDefaults.standard.object(forKey: "cell3ExpirationDate") as? Date ?? Date()
    
    
    enum SortOrder {
        case newestFirst, oldestFirst
    }
    
    /// History View Sections
    enum ViewSection: String, CaseIterable, Identifiable {
        case buildHistory = "Build History"
        case data = "Data"
        var id: String { self.rawValue }
    }
    
    /// Filter to find newest and oldest builds
    var sortedBuildHistorys: [Build] {
        switch sortOrder {
        case .newestFirst:
            return builds.sorted { $0.dateAdded > $1.dateAdded }
        case .oldestFirst:
            return builds.sorted { $0.dateAdded < $1.dateAdded }
        }
    }
    
    /// Creates a build number for each build
    private func buildNumber(for build: Build) -> Int {
        let sortedBuilds = builds.sorted { $0.dateAdded < $1.dateAdded }
        guard let index = sortedBuilds.firstIndex(where: { $0.dateAdded ==
            build.dateAdded }) else { return -1 }
        return index + 1 // Adding 1 because array indices start at 0
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Picker("Select View", selection: $selectedSection) {
                    ForEach(ViewSection.allCases) { section in
                        Text(section.rawValue).tag(section)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selectedSection == .buildHistory {
                    
                    
                    // sessionCountView(filteredSessions: filteredAndSortedSessions)
                    
                    if builds.isEmpty {
                        ContentUnavailableView(label: {
                            Label("No Builds", systemImage: "list.bullet.rectangle.portrait")
                        }, description: {
                            Text("Complete your first build to see your logs")
                                .padding()
                        })
                    } else {
                        Picker("Sort Order", selection: $sortOrder) {
                            Text("Newest First").tag(SortOrder.newestFirst)
                            Text("Oldest First").tag(SortOrder.oldestFirst)
                        }
                        .pickerStyle(.segmented)
                        .padding(.leading)
                        .padding(.trailing)
                        
                        /// Show total build count
                        buildCountView(builds: sortedBuildHistorys)
                        
                        List {
                            Section("Recent Builds") {
                                ForEach(sortedBuildHistorys) { build in
                                    let buildNum = buildNumber(for: build)
                                    NavigationLink(destination: BuildLogDetailView(build: build, buildNumber: buildNum)) {
                                        HStack {
                                            Text("Build #\(buildNum)")
                                            Spacer()
                                            Text(build.dateAdded, format: Date.FormatStyle().month().day())
                                        }
                                    }
                                }
                                .onDelete { indexSet in
                                    for index in indexSet {
                                        context.delete(sortedBuildHistorys[index])
                                    }
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                    
                } else {
                    
                    ScrollView {
                        
                        VStack {
                            VStack {
                                Text("Cell Expiration Dates")
                                    .font(.headline)
                                    
                            }
                            
                            VStack {
                              datePicker(for: 1)
                              datePicker(for: 2)
                              datePicker(for: 3)
                                
                            }
                        }
                        
                        
                        
                        /// Cell Charts
                        if builds.count > 1 {
                            VStack {
                                Text("Cell mV on Air")
                                    .font(.headline)
                                    .padding(.top)
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                VStack {
                                    CellAirChartView(builds: builds)
                                }
                            }
                            VStack {
                                Text("Cell mV on Oxygen")
                                    .font(.headline)
                                    .padding(.top)
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                VStack {
                                    CellO2ChartView(builds: builds)
                                }
                            }
                        } else {
                            ContentUnavailableView(label: {
                                Label("Not Enough Data", systemImage: "chart.xyaxis.line")
                            }, description: {
                                Text("Two or more builds are needed to show charts")
                                    .padding()
                            })
                        }
                        
                    }
                }
                
            }
        }
    }
    
    /// Date Picker for cells
    @ViewBuilder
    private func datePicker(for cellIndex: Int) -> some View {
        VStack {
            DatePicker(
                "Cell \(cellIndex)",
                selection: expirationDateBinding(for: cellIndex),
                displayedComponents: .date
            )
            .datePickerStyle(.compact)
            .onChange(of: expirationDateBinding(for: cellIndex).wrappedValue) { newValue in
                saveExpirationDate(newValue, for: cellIndex)
            }
        }
        .padding(.horizontal)
    }
    
    
    
    // Function to return the appropriate Binding<Date> based on the cell number
    private func expirationDateBinding(for cellIndex: Int) -> Binding<Date> {
        switch cellIndex {
        case 1:
            return $cell1ExpirationDate
        case 2:
            return $cell2ExpirationDate
        case 3:
            return $cell3ExpirationDate
        default:
            return .constant(Date()) // Fallback, should never be used
        }
    }
    
    private func saveExpirationDate(_ date: Date, for cellIndex: Int) {
        let key = "cell\(cellIndex)ExpirationDate"
        UserDefaults.standard.set(date, forKey: key)
        print("Saving date: \(date) for key: \(key)")
    }
    
    
    
    
    /// Session Total Counter
    @ViewBuilder
    private func buildCountView(builds: [Build]) -> some View {
        HStack {
            Text("Total Builds: ")
            Spacer()
            Text("\(builds.count)")
        }
        .font(.headline)
        .padding()
    }
}


#Preview {
    NavigationStack {
        BuildHistoryView()
            .modelContainer(for: Build.self)
    }
}
