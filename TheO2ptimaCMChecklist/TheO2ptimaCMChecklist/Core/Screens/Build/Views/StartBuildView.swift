//
//  StartBuildView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/5/23.
//

import SwiftUI

struct StartBuildView: View {
    @StateObject var appViewModel = AppViewModel()
     
    var body: some View {
        NavigationStack {
            VStack {
                Text("O2ptima CM Build Checklist")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            
            NavigationLink {
               BuildView2(appViewModel: appViewModel)
            } label: {
                Text("Begin")
                    .font(.title3)
                    .bold()
            }.buttonStyle(StandardButtonStyle())
        }
    }
}

#Preview {
    StartBuildView()
}
