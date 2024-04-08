import SwiftUI
import UserNotifications

struct InlineTimer: View {
    @Binding var selectedTime: Int
    @State private var timer: Timer?
    @State private var timeRemaining: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var showAlert: Bool = false
    @State private var expectedEndTime: Date?
    
    // Create an instance of NotificationHandler
    @State private var notificationHandler = NotificationHandler()

    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        VStack {
            HStack {
                Picker("Select Time", selection: $selectedTime) {
                    Text("30 sec").tag(30)
                    Text("2 minutes").tag(120)
                    Text("5 minutes").tag(300)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button(action: {
                    isTimerRunning ? stopTimer() : startTimer()
                }) {
                    Text(isTimerRunning ? "Stop" : "Start")
                        .foregroundColor(.white)
                        .padding()
                        .background(isTimerRunning ? Color.red : Color.green)
                        .cornerRadius(8)
                }
            }
            
            if isTimerRunning {
                VStack {
                    Text("Time Remaining: ")
                        .font(.title)
                    Text(formattedTime)
                        .font(.title)
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Timer Complete"), message: Text("The countdown timer has finished."), dismissButton: .default(Text("OK")))
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            adjustRemainingTime()
        }
    }

    private func startTimer() {
        guard !isTimerRunning else { return }
        isTimerRunning = true
        timeRemaining = selectedTime
        expectedEndTime = Calendar.current.date(byAdding: .second, value: selectedTime, to: Date())
        
        
        // Schedule the notification for when the timer is supposed to end.
        notificationHandler.sendNotification(
            date: Date().addingTimeInterval(Double(selectedTime)),
            type: "date", // Since we're scheduling based on a future date
            title: "Timer Complete",
            body: "Your countdown timer has finished."
        )

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                self.showAlert = true
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        // Now, notification is handled by startTimer, so this just handles UI.
        if timeRemaining == 0 {
            showAlert = true
        }
    }
    
    private func adjustRemainingTime() {
        guard let expectedEndTime = expectedEndTime else { return }

        let currentTime = Date()
        let remaining = Calendar.current.dateComponents([.second], from: currentTime, to: expectedEndTime).second ?? 0

        if remaining > 0 {
            timeRemaining = remaining
        } else {
            timeRemaining = 0
            if isTimerRunning {
                showAlert = true
                isTimerRunning = false
            }
        }
    }
}

// Preview Provider
struct InlineTimer_Previews: PreviewProvider {
    static var previews: some View {
        InlineTimer(selectedTime: .constant(30))
    }
}
