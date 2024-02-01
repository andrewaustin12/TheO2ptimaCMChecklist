
import SwiftUI
import SceneKit
import StoreKit

struct BuyMeACoffeeView: View {
    /// For 3D model
    @State var scene: SCNScene? = .init(named: "Coffee_Shop_Cup.scn")
    
    /// Fore revenueCat
    @State var myProduct: Product?
    @State var showPaywall = false
    
    /// For Tips views
    @State private var showTips = false
    @State private var showThanks = false
    
    @EnvironmentObject private var store: TipStore
    
    var body: some View {
        NavigationStack {
            ZStack {


                VStack(spacing: 20) {


                    // Coffee cup image
                    SceneView(scene: $scene)
                        .frame(height: 350)
                    
                    Text("Buy me a coffee")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    VStack(alignment: .leading) {
                        // Description text with custom icon color
                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.unitPrimary) // Replace with your custom icon color
                            Text("Fueling Ongoing Progress")
                                .foregroundColor(.primary) // Text color
                                .font(.title3)
                        }
                        .multilineTextAlignment(.center)
                        .padding(2)

                        // Description text with custom icon color
                        HStack {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.unitPrimary) // Replace with your custom icon color
                            Text("Empowering Future Endeavors")
                                .foregroundColor(.primary) // Text color
                                .font(.title3)
                        }
                        .multilineTextAlignment(.center)
                        .padding(2)

                        // Description text with custom icon color
                        HStack {
                            Image(systemName: "mug.fill")
                                .foregroundColor(.unitPrimary) // Replace with your custom icon color
                            Text("Supporting My Caffeine Fix")
                                .foregroundColor(.primary) // Text color
                                .font(.title3)
                        }
                        .multilineTextAlignment(.center)
                        .padding(2)
                    }





                    // Purchase button
                    Button(action: {
                        showTips.toggle()
                    }) {
                        Text("Support")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(width: 200, height: 50)
                            .background(Color(Color.unitPrimary)) // Replace with your custom color
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    Group {
                        if showTips {
                            Color.black.opacity(0.8)
                                .ignoresSafeArea()
                                .transition(.opacity)
                                .onTapGesture {
                                    showTips.toggle()
                                }
                            TipsView {
                                showTips.toggle()
                            }
                            .environmentObject(store)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                )
                .overlay(alignment: .bottom, content: {
                    
                    if showThanks {
                        ThanksView {
                            showThanks = false
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                })
                .animation(.spring(), value: showTips)
                .animation(.spring(), value: showThanks)
                .onChange(of: store.action) { action in
                    
                    if action == .successful {
                        
                        showTips = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
                            showThanks = true
                            store.reset()
                        }
                    }
                }
                .alert(isPresented: $store.hasError, error: store.error) {
                    
                }
            }
        }
    }
}
#Preview {
    NavigationStack {
        BuyMeACoffeeView()
            .environmentObject(TipStore())
    }
}
