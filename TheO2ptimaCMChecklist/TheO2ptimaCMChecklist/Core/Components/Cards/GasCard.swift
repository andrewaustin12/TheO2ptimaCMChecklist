//
//  GasCard.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct GasCard: View {
    
    var title: String
    var startingPP02: String
    var startingPressure: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                VStack{
                    Text("PP02:")
                        .font(.headline)
                    Text("\(startingPP02) %")
                        
                }
                Spacer()
                VStack{
                    Text("Pressure:")
                        .font(.headline)
                    Text("\(startingPressure) Bar")
                        
                }
            }
        }
        .padding()
    }
}

#Preview {
    GasCard(title: "0xygen", startingPP02: "21", startingPressure: "200")
}


