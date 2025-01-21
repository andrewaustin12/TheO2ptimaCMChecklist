//
//  ThanksView.swift
//  BuildingATipJar
//
//  Created by Tunde Adegoroye on 20/11/2022.
//

import SwiftUI

struct ThanksView: View {
    
    var didTapClose: () -> ()
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
                .frame(height: 40)
            
            Image(systemName: "heart.fill")
                .font(.system(size: 60))
                .foregroundColor(.pink)
            
            Text("Thank You")
                .font(.system(.title, design: .rounded).bold())
                .multilineTextAlignment(.center)
            
            Text("Your support means a lot to us")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
                .frame(height: 40)
            
            Button(action: didTapClose) {
                Text("Continue")
                    .font(.system(.body, design: .rounded).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.pink)
                    .cornerRadius(16)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemBackground))
        .ignoresSafeArea()
    }
}

struct ThanksView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView {}
    }
}
