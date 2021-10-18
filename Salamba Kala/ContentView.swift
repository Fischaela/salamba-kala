//
//  ContentView.swift
//  Salamba Kala
//
//  Created by Michaela Lehr on 17.10.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        VStack {
            Spacer()
            TimerBar(secondsElapsed: stopWatchManager.secondsElapsed)
            if stopWatchManager.mode == .stopped {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .blue)
                }
            }
            if stopWatchManager.mode == .running {
                Button(action: {self.stopWatchManager.pause()}) {
                    TimerButton(label: "Pause", buttonColor: .blue)
                }
            }
            if stopWatchManager.mode == .paused {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .blue)
                }
                Button(action: {self.stopWatchManager.stop()}) {
                    TimerButton(label: "Stop", buttonColor: .red)
                }
                    .padding(.top, 30)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .padding(.vertical, 20)
            .padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(10)
    }
}

struct TimerBar: View {
    let secondsElapsed: Double
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 80)
            Rectangle()
                .foregroundColor(.pink)
                .frame(width: screenSize.width - ((secondsElapsed / 10) * screenSize.width), height: 80)
                .animation(Animation.easeInOut(duration: 1))
            Text(String(format: "%.1f", secondsElapsed))
                .font(.custom("Avenir", size: 40))
                .padding(.leading, 10)
                .foregroundColor(.white)
        }
    }
}
