import SwiftUI

struct SettingsView: View {
    @AppStorage("isBarPsiChecked") private var isBarPsiChecked = false
    @EnvironmentObject var settings: SettingsManager
    @State private var showSetpointPicker = false
    
    // Fetch app version from Info.plist
    var appVersion: String {
        (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "Unknown"
    }
    
    var body: some View {
        VStack{
            List {
                
                Section {
                    Image("app-logo")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .frame(width: 320, height: 300)
                    
                }
                
                /// DEFAULTS SECTION
                Section("Defaults") {
                    Label {
                        Toggle("BAR or PSI", isOn: $isBarPsiChecked)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                    } icon: {
                        Image(systemName: "gauge.with.dots.needle.33percent")
                        
                    }
                    
                    Label {
                        HStack {
                            Text("Low Setpoint")
                            Spacer()
                            Text(String(format: "%.1f", settings.lowSetpoint))
                                .foregroundColor(.secondary)
                        }
                    } icon: {
                        Image(systemName: "gauge.with.dots.needle.bottom.50percent.badge.minus")
                    }
                    .onTapGesture {
                        showSetpointPicker = true
                    }
                    .sheet(isPresented: $showSetpointPicker) {
                        NavigationView {
                            VStack(spacing: 20) {
                                Text("Select Low Setpoint")
                                    .font(.headline)
                                    .padding(.top)
                                
                                Picker("Low Setpoint", selection: $settings.lowSetpoint) {
                                    ForEach([0.4, 0.5, 0.6, 0.7, 0.8, 0.9], id: \.self) { value in
                                        Text(String(format: "%.1f", value))
                                            .tag(value)
                                    }
                                }
                                .pickerStyle(.wheel)
                                
                                Text("The low setpoint determines when your rebreather will add oxygen")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(
                                leading: Button("Cancel") {
                                    showSetpointPicker = false
                                },
                                trailing: Button("Done") {
                                    showSetpointPicker = false
                                }
                                .fontWeight(.bold)
                            )
                        }
                        .presentationDetents([.height(300)])
                    }
                }
                /// DEVELOPER SECTION
                Section("Developer") {
                    HStack{
                        Label("Made by:", systemImage: "person")
                        NavigationLink("Andy") {
                            MyBioView()
                        }
                    }
                    NavigationLink(destination: BuyMeACoffeeView()) {
                        Label("Support future development", systemImage: "mug.fill")
                    }
                }
                /// SUPPORT SECTION
                Section("Support") {
                    Label("Version \(appVersion)", systemImage: "apps.iphone")
                    
                    Label {
                        HStack {
                            Text("Feature & Feedback")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "lightbulb.min")
                            
                    }
                    .onTapGesture {
                        openIdeasandbugz()
                    }
                    Label {
                        HStack {
                            Text("Report a bug")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "ant")
                            
                    }
                    .onTapGesture {
                        openIdeasandbugz()
                    }
                    
                    Label {
                        HStack {
                            Text("Follow on Instagram")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "person.2")
                            
                    }
                    .onTapGesture {
                        openInstagramProfile()
                    }
                    Label {
                        HStack {
                            Text("Visit the website")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "macbook")
                            
                    }
                    .onTapGesture {
                        openWebsite()
                    }
                    
                }
            }
        }
    }
}




#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(SettingsManager())
    }
}

struct TwitterLink: View {
    var body: some View {
        Button(action: {
            let userName = "andy_austin_dev"
            if let url = URL(string: "twitter://user?screen_name=\(userName)") {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Andy Austin")
        }
    }
}

/// Support Section

func openMail() {
    let email = "theccrchecklists@yahoo.com"
    let subject = "The O2ptima CM Checklist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let urlString = "mailto:\(email)?subject=\(subject)"
    
    if let url = URL(string: urlString) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}



func openInstagramProfile() {
    let userName = "theccrchecklists" // Replace with your Instagram username
    if let url = URL(string: "instagram://user?username=\(userName)"),
       UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url)
    } else {
        // If Instagram app is not installed, open Instagram website in Safari
        if let webURL = URL(string: "https://www.instagram.com/\(userName)") {
            UIApplication.shared.open(webURL)
        }
    }
}


func openWebsite() {
    let websiteURL = URL(string: "https://theccrchecklists.wixsite.com/theccrchecklists")!
    UIApplication.shared.open(websiteURL)
}

func openIdeasandbugz() {
    let websiteURL = URL(string: "https://www.ideasandbugz.com/feedback/o2ptima-cm-checklist")!
    UIApplication.shared.open(websiteURL)
}
