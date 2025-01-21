import SwiftUI
import StoreKit

struct BuyMeACoffeeView: View {
    @EnvironmentObject private var store: TipStore
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showTips = false
    @State private var showThanks = false
    
    private let accentColor = Color.blue
    private let backgroundColor = Color(uiColor: .systemBackground)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 22) {
                    // Header Section
                    VStack(spacing: 12) {
                        Image(systemName: "cup.and.saucer.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.blue)
                            .symbolEffect(.bounce, value: showTips)
                        
                        Text("Support Future Innovation")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                        
                        Text("Help shape the next generation of features")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 32)
                    
                    // Features List
                    VStack(spacing: 16) {
                        featureRow(
                            icon: "sparkles",
                            text: "Power New Features",
                            description: "Support the development of innovative capabilities",
                            color: .purple
                        )
                        
                        featureRow(
                            icon: "arrow.clockwise",
                            text: "Regular Updates",
                            description: "Enable continuous improvements and refinements",
                            color: .blue
                        )
                        
                        featureRow(
                            icon: "heart.fill",
                            text: "Show Your Support",
                            description: "Join the community of app supporters",
                            color: .red
                        )
                    }
                    .padding(.horizontal)
                    
                    // Support Button
                    Button(action: { showTips.toggle() }) {
                        Text("Make a Difference")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 8)
                    
                    Text("Your support directly enables new features and improvements")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                .padding(.bottom, 24)
            }
            .background(backgroundColor)
            .sheet(isPresented: $showTips) {
                TipsView { showTips.toggle() }
                    .environmentObject(store)
            }
            .sheet(isPresented: $showThanks) {
                ThanksView { showThanks = false }
            }
            .onChange(of: store.action) { action in
                if action == .successful {
                    showTips = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showThanks = true
                        store.reset()
                    }
                }
            }
            .alert(isPresented: $store.hasError, error: store.error) { }
        }
    }
    
    private func featureRow(icon: String, text: String, description: String, color: Color) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(color.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(16)
    }
}

#Preview {
    BuyMeACoffeeView()
        .environmentObject(TipStore())
}
