import SwiftUI
import Charts
import SwiftData // Assuming this is needed for your overall project, not directly in this snippet

struct CellO2ChartView: View {
    var builds: [Build]

    var body: some View {
        VStack {
            

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 30) {
                    ForEach(1...3, id: \.self) { cellNumber in
                        cellChart(for: values(for: cellNumber), cellNumber: cellNumber)
                            .frame(width: UIScreen.main.bounds.width - 40) // Subtracting padding from both sides
                            .padding(.horizontal, 20) // 20 points padding on each side
                    }
                }
            }

        }
    }

    private func cellChart(for values: [Double], cellNumber: Int) -> some View {
        VStack {
            Text("Cell \(cellNumber)")
                .font(.headline)
                .padding(.vertical)
                .fontWeight(.medium)
                .foregroundColor(.secondary)

            Chart {
                ForEach(Array(values.enumerated()), id: \.offset) { index, value in
                    AreaMark(
                        x: .value("Build", index),
                        y: .value("Value", value)
                    )
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .clear]), startPoint: .top, endPoint: .bottom))
                }
            }
            .frame(height: 150)  // Increased height for better chart visibility
            .chartYScale(domain: .automatic)
            .chartXAxis {
                // Hiding the x-axis labels
                
            }
            .chartYAxis {
                // You can customize or hide the y-axis similarly if needed
                AxisMarks(preset: .automatic, position: .leading)
            }
        }
        .padding(.bottom, 5)
    }

    private func values(for cellNumber: Int) -> [Double] {
        switch cellNumber {
        case 1: return builds.map { $0.cellOneO2 }
        case 2: return builds.map { $0.cellTwoO2 }
        case 3: return builds.map { $0.cellThreeO2 }
        default: return []
        }
    }
}


//#Preview {
//    CellO2ChartView()
//}
