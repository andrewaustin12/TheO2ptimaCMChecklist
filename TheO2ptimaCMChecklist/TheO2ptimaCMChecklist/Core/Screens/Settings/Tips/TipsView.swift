import SwiftUI

struct TipsView: View {
    @EnvironmentObject private var store: TipStore
    @Environment(\.colorScheme) var colorScheme
    
    var didTapClose: () -> ()
    
    private let backgroundColor = Color(uiColor: .secondarySystemBackground)
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    // Close Button
                    HStack {
                        Spacer()
                        Button(action: didTapClose) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 32, weight: .medium))
                                .foregroundStyle(.secondary)
                                .padding(.trailing, 8)
                        }
                    }
                    
                    // Icon
                    if #available(iOS 18.0, *) {
                        Image(systemName: "star.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.blue)
                            .symbolEffect(.bounce)
                    } else {
                        Image(systemName: "star.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.blue)
                            
                    }
                    
                    // Title and Description
                    VStack(spacing: 8) {
                        Text("Support This App")
                            .font(.system(.title2, design: .rounded).bold())
                            .multilineTextAlignment(.center)
                        
                        Text("Your contribution helps create new features and improvements, making this app even better for everyone.")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                
                // Tip Options
                VStack(spacing: 12) {
                    ForEach(store.items) { item in
                        TipsItemView(item: item)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                .padding(.horizontal)
                
                // Footer
                Text("Thank you for supporting independent development")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding(.vertical, 24)
        }
        .ignoresSafeArea()
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 20, y: 10)
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView {}
            .environmentObject(TipStore())
    }
}
