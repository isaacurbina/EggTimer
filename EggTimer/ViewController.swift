//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var topLabel: UILabel!
	
	// egg times in seconds
	let eggTimes = [
		"Soft" : 5 * 60,
		"Medium": 8 * 60,
		"Hard": 12 * 60
	]
	var secondsRemaining = 0
	var timer = Timer()
    
	@IBAction func hardnessSelected(_ sender: UIButton) {
		timer.invalidate()
		topLabel.text = "How do you like your eggs?"
		
		let hardness = sender.currentTitle!
		secondsRemaining = eggTimes[hardness] ?? 0
	
		if (secondsRemaining > 0) {
			timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
		}
	}
	
	@objc func updateTimer() {
		if secondsRemaining > 0 {
			print("\(secondsRemaining) seconds.")
			secondsRemaining -= 1
		} else {
			topLabel.text = "DONE!"
			timer.invalidate()
		}
	}
}

