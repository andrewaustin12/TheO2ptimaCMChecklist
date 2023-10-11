
import SwiftUI


struct CountdownTimerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var timeRemaining = 0
    @State var timerActive = false
    @State private var showAlert = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .padding(20)
                        
                        
                }
                .padding()
                Spacer()
            }
            Spacer()
            
            VStack {
                Text("Countdown Timer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                HStack {
                    Button(action: {
                        self.timeRemaining = 30
                        self.timerActive = false
                    }) {
                        Text("30 sec")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color(.systemGreen))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        self.timeRemaining = 120
                        self.timerActive = false
                    }) {
                        Text("2 min")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color(.systemGreen))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        self.timeRemaining = 300
                        self.timerActive = false
                    }) {
                        Text("5 min")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color(.systemGreen))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }

                if timerActive {
                    Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .onReceive(timer) { _ in
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1
                            } else {
                                self.timerActive = false
                                self.timeRemaining = 0
                            }
                        }
                } else {
                    Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")

                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }

                HStack {
                    Button(action: {
                        self.timerActive = false
                        self.timeRemaining = 0
                    }) {
                        Text("Stop")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color(.systemRed))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }


                    Button(action: {
                        if !self.timerActive && self.timeRemaining > 0 {
                            self.timerActive = true
                        }
                    }) {
                        Text("Start")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color(.systemGreen))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .onChange(of: timeRemaining) {
                  if timeRemaining == 0 && timerActive == true {
                      timerActive.toggle()
                  }
                }
            }
            .frame(width: 360, height: 300)
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
            
            Spacer()
            
            Spacer()
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Timer Done!"),
                message: Text("Your timer has finished."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    CountdownTimerView()
}
