//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
// audio + visual foundational module. lets you interact with the audio hardware
//Work with audiovisual assets, control device cameras, process audio, and configure system audio interactions
import AVFoundation

class ViewController: UIViewController {
 
    //For playback and recording of a single track, use AVAudioPlayer and AVAudioRecorder. (from Apple devoleper website)
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var alpha = 1

    @IBAction func keyPressed(_ sender: UIButton) {
      // use to triger the code below (calls it)
        playSound(soundName: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            print("start")
            sender.alpha = 0.5 // 50% opacity
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            print("end")
                   sender.alpha = 1 //100% opacity
        }
        }
    }
    
 // taken from the web
    //grab the file from our resouces "C.wave", play the noise even if phone is silent and then play it ---- if there are any errors, the computer finds it and prints it out below.
    func playSound(soundName: String) {
        //A representation of the code and resources stored in a bundle directory on disk..using main bundle to locte sound resource
        // creating a variable URL that's looking for a resouce called C.wav,  in our resources (Bundle.main.url)
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

        do {
            //"playback"means that playing music is essential to the success of the app -- it is a "Type Property"
                    // plays sound even if the phone is on silence
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}
