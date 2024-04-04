//
//  InlineTimer.swift
//  TheO2ptimaCMChecklist
//
//  Created by andrew austin on 2/2/24.
//

import SwiftUI
import UserNotifications

struct InlineTimer: View {
    @Binding var selectedTime: Int
    @State private var timer: Timer?
    @State private var timeRemaining: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var showAlert: Bool = false

    // Create an instance of NotificationHandler
    @State private var notificationHandler = NotificationHandler()
    
    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60

        if minutes > 0 {
            return String(format: "%d:%02d", minutes, seconds)
        } else if seconds > 0 {
            return String(format: "%d seconds", seconds)
        } else {
            return "Time's up!"
        }
    }

    var body: some View {
        VStack {
            HStack {
                Picker("Select Time", selection: $selectedTime) {
                    Text("30 seconds").tag(30)
                    Text("2 minutes").tag(120)
                    Text("5 minutes").tag(300)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button(action: {
                    startTimer()
                }) {
                    Text(isTimerRunning ? "Stop" : "Start")
                        .foregroundColor(.white)
                        .padding(9)
                        .background(isTimerRunning ? Color.red : Color.green)
                        .cornerRadius(8)
                }
            }
            
            if isTimerRunning {
                VStack {
                    Text("Time Remaining: ")
                        .font(.title)
                    Text("\(formattedTime)")
                        .font(.title)
                        .overlay(
                            Button(action: {}) {
                                EmptyView()
                            }
                        )
                        
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Timer Complete"), message: Text("The countdown timer has finished."), dismissButton: .default(Text("OK")))
        }
    }

    private func startTimer() {
        guard !isTimerRunning else { return }
        isTimerRunning = true
        timeRemaining = selectedTime
        
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
}

struct InlineTimer_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    struct ContentView: View {
        @State private var selectedTime = 30

        var body: some View {
            VStack {
            

                InlineTimer(selectedTime: $selectedTime)
                    .padding()
            }
        }
    }
}

