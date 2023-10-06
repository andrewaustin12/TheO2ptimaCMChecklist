
import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            StartBuildView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "water.waves")
                    Text("Build")
                }.tag(0)
            
            SettingsView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(1)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainTabView()
}

