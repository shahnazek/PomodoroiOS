//
//  CounterClass.swift
//  PomodoroiOS
//
//  Created by Shahnaz EK on 14/07/22.
//

import UIKit
import AVFoundation


class CounterClass: UIViewController {
    
    var player: AVAudioPlayer!

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var resetLabel: UIButton!
    
    var timer = Timer()
    var isTimerStarted = false
    var time = 1500
    var breakTime = 120
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func resetPressed(_ sender: UIButton) {
        
        timer.invalidate()
        time = 1500
        isTimerStarted = false
        counterLabel.text = "25 : 00"
        startLabel.setTitle("START", for: .normal)
        startLabel.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .semibold)

        
    }
    
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        if !isTimerStarted {
            
            startCounter()
            isTimerStarted = true
            startLabel.setTitle("PAUSE", for: .normal)
            startLabel.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)

            
        } else {
            
            timer.invalidate()
            isTimerStarted = false
            startLabel.setTitle("RESUME", for: .normal)
            startLabel.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)

            
        }
    }
    
    func startCounter() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateCounter)), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        
        time -= 1
        counterLabel.text = formatCounter()
        playSound()
        
        if counterLabel.text == "00 : 00" {
            
            timer.invalidate()
            time = 1500
            isTimerStarted = false
            counterLabel.text = "25 : 00"
            startLabel.setTitle("START", for: .normal)
            startLabel.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .semibold)
            
        }
    
    }
    
    func formatCounter() -> String {
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format : "%02i : %02i", minutes, seconds)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "clocktick", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}


// change the button titles to images in the counter
// add different sound when the focus time has ended and marks the beginning of the break time
// add 5 minute break once the counter reaches 00 : 00
// create another function for break and then call the function when the timer hits 00 : 00
