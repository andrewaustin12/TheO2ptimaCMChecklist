
import SwiftUI

struct WarningView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    WarningHeaderView(title1: "The", title2: "O2ptima CM", title3: "Checklist")
                }
                .ignoresSafeArea()
                
                    
                VStack {
                    Text("WARNING")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .padding(.bottom)
                    
                    Text("This app is not a replacement for professional CCR training. By using this app I agree that I have had proper training on how to assemble my rebreather from a certified instructor. I agree that I am solely responsible for the correct assembly of my rebreather.")
                        .padding(.leading)
                        .padding(.trailing)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        
                }
                
                Spacer()
  
                NavigationLink {
                    MainTabView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("I Agree")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .background(.white)
        }
        .splashViewModifier {
          ZStack {
            SplashView()
          }
        }
    }
}

#Preview {
    WarningView()
}
