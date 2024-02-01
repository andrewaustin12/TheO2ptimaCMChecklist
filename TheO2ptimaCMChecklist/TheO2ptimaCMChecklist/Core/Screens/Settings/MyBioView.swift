//
//  MyBioView.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 2/1/24.
//

import SwiftUI

struct MyBioView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Large photo at the top
                    Image("bio-pic") // Replace with your actual image name
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .padding()

                    // Developer's bio
                    Text("Andy")
                        .font(.title)
                        .padding([.leading, .bottom, .trailing])

                    Text("Hello, I am a passionate technical diver and former TDI Instructor. I am the developer of The CCR Checklists and a Rebreather diver myself. I love exploring wrecks and caves in my spare time.")
                        .padding([.leading, .bottom, .trailing])
                    Text("These apps are passion projects which are supported by donations and purchasing the app. I hope you enjoy the app!")
                        .padding([.leading, .bottom, .trailing])
                }
            }
            .navigationTitle("Your Developer")
        }
    }
}

#Preview {
    MyBioView()
}
