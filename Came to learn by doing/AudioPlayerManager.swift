import Foundation
import AVFoundation

class AudioPlayerManager {
    
    static var shared = AudioPlayerManager()
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound(forResource: String?, ofType: String?) {
        guard let path = Bundle.main.path(forResource: forResource, ofType: ofType) else { return }
        
        audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))        
        audioPlayer?.play()
    }
}

