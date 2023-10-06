//
//  SpashView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 10/4/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("app-logo")
                .resizable()
                .frame(width: 400,height: 400)
        }
    }
}

#Preview {
    SplashView()
}
