//
//  StandardButtonStyle.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/6/23.
//

import SwiftUI

struct StandardButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0,
                       maxWidth: 260)
                .frame(height: 45)
                .background( RoundedRectangle(cornerRadius: 5.0).fill(.unitPrimary).opacity(colorScheme == .dark ? 0.7 : 1.0)
                
                ).padding()
    }
}


