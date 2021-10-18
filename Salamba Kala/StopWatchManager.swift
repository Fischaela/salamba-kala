import SwiftUI

class StopWatchManager: ObservableObject {
    
    @Published var mode: stopWatchMode = .stopped
    @Published var secondsElapsed = 10.0
    var timer = Timer()
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.secondsElapsed > 0 {
                self.secondsElapsed -= 0.1
            } else {
                self.stop()
            }
        }
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 10.0
        mode = .stopped
    }
    
}

enum stopWatchMode {
    case running
    case stopped
    case paused
}
