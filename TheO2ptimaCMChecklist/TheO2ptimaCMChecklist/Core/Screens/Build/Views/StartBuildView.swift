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
            Spacer()
            VStack {
                
                Image("app-logo")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .font(.system(size: 200))
            }
            .padding()
            
            NavigationLink {
               BuildView2(appViewModel: appViewModel)
            } label: {
                Text("Begin")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
            }.buttonStyle(StandardButtonStyle())
            Spacer()
        }
    }
}

#Preview {
    StartBuildView()
}
