//
//  ViewController.swift
//  Xylophone
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer = AVAudioPlayer()
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        var selectedSoundFileName: String = ""
        selectedSoundFileName = soundArray[sender.tag - 1]
        
        print (selectedSoundFileName)                           // for debugging
        playSound(soundFileName: selectedSoundFileName)         // can directly pass the argument/value here, but trying this out
    }
    
    func playSound (soundFileName: String) {
        
        // 1. define the location of the sound file, aka the sound URL
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        // 2. create an instance of the audio player
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        // 3. play the audio player
        audioPlayer.play()
    }
}

