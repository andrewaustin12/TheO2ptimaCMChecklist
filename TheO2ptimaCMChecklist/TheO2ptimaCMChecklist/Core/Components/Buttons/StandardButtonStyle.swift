//
//  StandardButtonStyle.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct StandardButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0,
                       maxWidth: 260)
                .frame(height: 50)
                .foregroundColor(.white)
                .background( RoundedRectangle(cornerRadius: 5.0).fill(.unitPrimary).opacity(0.6)
            )
        }
}


