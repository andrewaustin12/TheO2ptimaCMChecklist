import SwiftUI

struct SettingsView: View {
    @AppStorage("isBarPsiChecked") private var isBarPsiChecked = false
    
    var body: some View {
        VStack{
            List {
                
                Section {
                    Image("app-logo")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .frame(width: 320, height: 300)
                    
                }
                Section("Defaults") {
                    Label {
                        Toggle("BAR or PSI", isOn: $isBarPsiChecked)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                    } icon: {
                        Image(systemName: "gauge.with.dots.needle.33percent")
                        
                    }
                }
                
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
                
                Section("Support") {
                    Label("Version 1.2", systemImage: "apps.iphone")
                    
                    Label {
                        HStack {
                            Text("Feature Request")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "lightbulb.min")
                            
                    }
                    .onTapGesture {
                        openMail()
                    }
                    Label {
                        HStack {
                            Text("Give Feedback")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "envelope")
                            
                    }
                    .onTapGesture {
                        openMail()
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

