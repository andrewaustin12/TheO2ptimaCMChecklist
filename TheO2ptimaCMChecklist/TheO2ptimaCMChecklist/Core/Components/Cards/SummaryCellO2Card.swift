//
//  SummaryCellO2Card.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/7/23.
//

import SwiftUI

struct SummaryCellO2Card: View {
    var title: String
    var cell1: String
    var cell2: String
    var cell3: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                VStack{
                    Text("Cell 1")
                        .font(.headline)
                    Text("\(cell1) mV")
                }
                Spacer()
                VStack{
                    Text("Cell 2")
                        .font(.headline)
                    Text("\(cell2) mV")
                }
                Spacer()
                VStack{
                    Text("Cell 3")
                        .font(.headline)
                    Text("\(cell2) mV")
                }
            }
        }
        .padding()
    }
}

#Preview {
    SummaryCellO2Card(title: "mV Readings w/ Air:", cell1: "1.06", cell2: "1.01", cell3: "1.04")}
