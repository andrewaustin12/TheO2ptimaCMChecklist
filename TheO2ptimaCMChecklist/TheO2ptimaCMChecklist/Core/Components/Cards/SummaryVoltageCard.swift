//
//  SummaryVoltageCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct SummaryVoltageCard: View {
    
    var title: String
    var extVoltage: String
    var intVoltage: String

    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .padding(.bottom, 1)
                .padding(.top, 0)
            HStack {
                Spacer()
                VStack {
                    Text("Ext.")

                    Text("\(extVoltage)V")
                    
                }
                Spacer()
                VStack {
                    Text("Int.")
                    
                    Text("\(intVoltage)V")
                    
                    
                }
                Spacer()
            }

        }
    }
}
#Preview {
    SummaryVoltageCard(title: "Voltage Summary", extVoltage: "8", intVoltage: "4.5")
}
