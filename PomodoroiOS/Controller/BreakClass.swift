//
//  BreakClass.swift
//  PomodoroiOS
//
//  Created by Shahnaz EK on 27/07/22.
//

import Foundation
import UIKit
import AVFoundation


class BreakClass : UIViewController {
    
//    var player: AVAudioPlayer!
    
    @IBOutlet weak var breakCounter: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var resetLabel: UIButton!
    
    var timer = Timer()
    var isTimerStarted = false
    var breakTime : Int = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        if !isTimerStarted {
            
            startCounter()
            isTimerStarted = true
            startLabel.setTitle("PAUSE", for: .normal)
            sender.setImage(UIImage(named: "Pause.png"), for: .normal)

//            startLabel.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)

        } else {
            
            timer.invalidate()
            isTimerStarted = false
            startLabel.setTitle("RESUME", for: .normal)
            sender.setImage(UIImage(named: "Resume.png"), for: .normal)

//            startLabel.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
            
        }
        
    }
    
    
    @IBAction func resetPressed(_ sender: UIButton) {
        
        timer.invalidate()
        breakTime = 300
        isTimerStarted = false
        breakCounter.text = "05 : 00"
        startLabel.setImage(UIImage(named: "Play.png"), for: .normal)
        
//        startLabel.setTitle("START", for: .normal)
//        startLabel.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .semibold)
        
    }
    
    
    
    func startCounter() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateCounter)), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        
        breakTime -= 1
        breakCounter.text = formatCounter()
//        playSound()
        
        if breakCounter.text == "00 : 00" {
            
            timer.invalidate()
            breakTime = 300
            isTimerStarted = false
            breakCounter.text = "05 : 00"
            startLabel.setImage(UIImage(named: "Play.png"), for: .normal)
            
//            startLabel.setTitle("START", for: .normal)
//            startLabel.titleLabel?.font = .systemFont(ofSize: 25.0, weight: .semibold)
            
        }
    
    }
    
    func formatCounter() -> String {
        
        let minutes = Int(breakTime) / 60 % 60
        let seconds = Int(breakTime) % 60
        return String(format : "%02i : %02i", minutes, seconds)
    }
    
//    func playSound() {
//        let url = Bundle.main.url(forResource: "clocktick", withExtension: "mp3")
//        player = try! AVAudioPlayer(contentsOf: url!)
//        player.play()
//
//    }
    
}
