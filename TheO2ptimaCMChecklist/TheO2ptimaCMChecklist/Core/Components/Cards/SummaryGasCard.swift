import SwiftUI

struct SummaryGasCard: View {
    var title: String
    var o2Content: String
    var bailoutOneDilContent: String
    var bailoutTwoContent: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack {
                VStack {
                    Text("Oxygen:")
                        .font(.headline)
                    // Apply the formatGasMixture function
                    Text(formatGasMixture(o2Content))
                }
                Spacer()

                VStack {
                    Text("Bail/Dil:")
                        .font(.headline)
                    // Apply the formatGasMixture function
                    Text(formatGasMixture(bailoutOneDilContent))
                }
                
                
                // Conditionally render this VStack only if bailoutTwoContent has a value
                if !bailoutTwoContent.isEmpty {
                    Spacer()
                    VStack {
                        Text("Bail/Dil 2:")
                            .font(.headline)
                        // Apply the formatGasMixture function
                        Text(formatGasMixture(bailoutTwoContent))
                    }
                }
            }
        }
        .padding()
    }
    
    // Make sure formatGasMixture can be called here
    func formatGasMixture(_ mixture: String) -> String {
        if let decimalValue = Double(mixture) {
            if decimalValue < 1 {
                let percentageValue = decimalValue * 100
                return floor(percentageValue) == percentageValue ? "\(Int(percentageValue))%" : String(format: "%.1f%%", percentageValue)
            } else {
                return floor(decimalValue) == decimalValue ? "\(Int(decimalValue))%" : String(format: "%.1f%%", decimalValue)
            }
        } else {
            return mixture.contains("/") ? mixture : mixture + "%" // Check for trimix notation
        }
    }
}

struct SummaryGasCard_Previews: PreviewProvider {
    static var previews: some View {
        SummaryGasCard(title: "Gas Contents", o2Content: "0.99", bailoutOneDilContent: "21", bailoutTwoContent: "18/80")
    }
}
