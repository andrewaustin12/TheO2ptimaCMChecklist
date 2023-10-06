//
//  TitleHeaderView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI


struct TitleHeaderView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.leading)

            Text("O2ptima CM CHECKLIST")
                .bold()
                .padding(.leading)
            
        }
    }
}


#Preview {
    TitleHeaderView(title: "Assembly")
}
