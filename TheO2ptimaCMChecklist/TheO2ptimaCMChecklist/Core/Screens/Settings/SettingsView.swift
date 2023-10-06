import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            
            
            if #available(iOS 15.0, *) {
                List {
                    
                    Section {
                        Image("app-logo")
                            .resizable()
                            .frame(width: 320, height: 300)
                        
                    }
                    
                    Section("Developer") {
                        HStack{
                            Text("Made by: ")
                            TwitterLink()
                        }
                        Text("Version 1.0")
                        InstagramLink()
                    }
                    
                    Section("Help") {
                        RequestFeatures()
                        GiveFeedback()
                        
                    }
                }
            } else {
                List {
                    
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct InstagramLink: View {
    var body: some View {
        Button(action: {
            let userName = "theccrchecklists" // Replace with your Instagram username
            if let url = URL(string: "instagram://user?username=\(userName)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                } else {
                    // If Instagram app is not installed, open Instagram website in Safari
                    let webURL = URL(string: "https://www.instagram.com/\(userName)")!
                    UIApplication.shared.open(webURL)
                }
            }
        }) {
            Text("Follow us on Instagram")
        }
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

struct RequestFeatures: View {
    var body: some View {
        Button("Request Features") {
            let email = "theccrchecklists@yahoo.com"
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func openMail() {
        let url = URL(string: "message://")
        if let url = url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

struct GiveFeedback: View {
    var body: some View {
        Button("Give Feedback") {
            let email = "theccrchecklists@yahoo.com"
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func openMail() {
        let url = URL(string: "message://")
        if let url = url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

