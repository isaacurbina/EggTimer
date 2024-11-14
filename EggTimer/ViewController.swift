//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	@IBOutlet weak var topLabel: UILabel!
	
	@IBOutlet weak var progressBar: UIProgressView!
	
	var player: AVAudioPlayer!
	
	// egg times in seconds
	let eggTimes = [
		"Soft" : 5,
		"Medium": 8,
		"Hard": 12
	]
	var cookingTime = 0
	var secondsRemaining = 0
	var timer = Timer()
    
	@IBAction func hardnessSelected(_ sender: UIButton) {
		timer.invalidate()
		
		progressBar.progress = 0.0
		progressBar.alpha = 1.0
		
		topLabel.text = "How do you like your eggs?"
		
		let hardness = sender.currentTitle!
		cookingTime = eggTimes[hardness] ?? 0
		secondsRemaining = cookingTime
		
		if (secondsRemaining > 0) {
			timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
		}
	}
	
	@objc func updateTimer() {
		if secondsRemaining > 0 {
			secondsRemaining -= 1
	
			let progress = Float(cookingTime - secondsRemaining) / Float(cookingTime)
			progressBar.progress = progress
		} else {
			playSound(soundName: "alarm_sound", extensionName: "mp3")
			topLabel.text = "DONE!"
			progressBar.progress = 1.0
			progressBar.alpha = 0.0
			timer.invalidate()
		}
	}
	
	func playSound(soundName: String, extensionName: String) {
		let url = Bundle.main.url(forResource: soundName, withExtension: extensionName)
				player = try! AVAudioPlayer(contentsOf: url!)
				player.play()
	}
}

