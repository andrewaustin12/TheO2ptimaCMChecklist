//
//  SummaryGasCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

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
            HStack{
                VStack{
                    Text("Oxygen:")
                        .font(.headline)
                    Text("\(o2Content) %")
                        
                }
                Spacer()
                VStack{
                    Text("Diluent:")
                        .font(.headline)
                    Text("\(bailoutOneDilContent) %")
                        
                }
                Spacer()
                VStack{
                    Text("Bailout 2:")
                        .font(.headline)
                    Text("\(bailoutTwoContent) %")
                        
                }
            }
        }
        .padding()
    }
}

#Preview {
    SummaryGasCard(title: "Gas Contents", o2Content: "99", bailoutOneDilContent: "21", bailoutTwoContent: "21")
}
