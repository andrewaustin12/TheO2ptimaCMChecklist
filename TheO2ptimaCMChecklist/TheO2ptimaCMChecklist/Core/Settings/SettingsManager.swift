import Foundation

class SettingsManager: ObservableObject {
    @Published var lowSetpoint: Double {
        didSet {
            UserDefaults.standard.set(lowSetpoint, forKey: "lowSetpoint")
        }
    }
    
    init() {
        // Load saved value or use default of 0.7
        self.lowSetpoint = UserDefaults.standard.double(forKey: "lowSetpoint")
        if self.lowSetpoint == 0 {
            self.lowSetpoint = 0.7
            UserDefaults.standard.set(0.7, forKey: "lowSetpoint")
        }
    }
} 