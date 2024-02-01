////
////  CellAccuracyBarChart.swift
////  theSidewinderChecklist
////
////  Created by andrew austin on 1/12/24.
////
//
//import SwiftUI
//import Charts
//import SwiftData // Assuming this is needed for your overall project, not directly in this snippet
//
//struct CellAccuracyBarChartView: View {
//    var builds: [Build]
//
//    var body: some View {
//        VStack {
//            Text("Cell Values on Air")
//                .font(.headline)
//                .padding()
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(alignment: .top, spacing: 30) {
//                    // Chart for Cell 1 Values on Air
//                    cellChart(for: builds.map { $0.cellOneAir }, cellNumber: 1)
//
//                    // Chart for Cell 2 Values on Air
//                    cellChart(for: builds.map { $0.cellTwoAir }, cellNumber: 2)
//
//                    // Chart for Cell 3 Values on Air
//                    cellChart(for: builds.map { $0.cellThreeAir }, cellNumber: 3)
//                }
//            }
//            .padding(.horizontal) // Padding for the entire horizontal ScrollView
//        }
//    }
//
//    private func cellChart(for values: [Double], cellNumber: Int) -> some View {
//        VStack {
//            Text("Cell \(cellNumber) on Air")
//                .font(.headline)
//                .padding(.vertical)
//
//            Chart {
//                ForEach(Array(values.enumerated()), id: \.offset) { index, value in
//                    BarMark(
//                        x: .value("Build", index + 1),
//                        y: .value("Value", value)
//                    )
//                    .foregroundStyle(by: .value("Cell", "Cell \(cellNumber)"))
//                }
//            }
//            .frame(height: 200) // Adjusted frame size for better readability
//            .chartYScale(domain: .automatic)
//        }
//    }
//}
//
//
//
//
//
//
//
//
////#Preview {
////    CellAccuracyBarChartView(builds: [Build].first)
////        .modelContainer(for: Build.self)
////}
