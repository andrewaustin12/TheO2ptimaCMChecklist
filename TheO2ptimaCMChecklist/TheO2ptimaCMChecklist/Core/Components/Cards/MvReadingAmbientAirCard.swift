import SwiftUI

struct MvReadingAmbientAirCard: View {
    @Binding var build: Build
    // Assuming you have the @Environment property for the model context as needed
    
    @State private var cellOneAirInput = ""
    @State private var cellTwoAirInput = ""
    @State private var cellThreeAirInput = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Record mV Readings w/ Air:")
                .font(.title3)
                .padding(.bottom, 1)
            
            HStack {
                cellInputField(title: "Cell 1", input: $cellOneAirInput, cellValue: $build.cellOneAir)
                
                Spacer()
                
                cellInputField(title: "Cell 2", input: $cellTwoAirInput, cellValue: $build.cellTwoAir)
                
                Spacer()
                
                cellInputField(title: "Cell 3", input: $cellThreeAirInput, cellValue: $build.cellThreeAir)
            }
            .padding()
        }
        .onAppear {
            // Initialize the text fields with existing values if they are not 0
            cellOneAirInput = build.cellOneAir != 0 ? String(build.cellOneAir) : ""
            cellTwoAirInput = build.cellTwoAir != 0 ? String(build.cellTwoAir) : ""
            cellThreeAirInput = build.cellThreeAir != 0 ? String(build.cellThreeAir) : ""
        }
    }
    
    private func cellInputField(title: String, input: Binding<String>, cellValue: Binding<Double>) -> some View {
        VStack {
            Text(title)
            TextField("mV", text: input)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: input.wrappedValue) { newValue in
                    if let value = Double(newValue) {
                        cellValue.wrappedValue = value
                    } else {
                        // If the new value isn't a valid Double, consider how you want to handle this
                        // For now, we'll not update the cellValue to avoid overriding with incorrect data
                    }
                }
        }
    }
}


// Preview for development and testing
struct MvReadingAmbientAirCard_Previews: PreviewProvider {
    static var previews: some View {
        MvReadingAmbientAirCard(build: .constant(Build()))
    }
}
