//
//  ViewController.swift
//  reloj
//
//  Created by DIEGO BROWN on 3/10/17.
//  Copyright © 2017 ZEUSOFOHIO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Buttons
    @IBOutlet var playButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    //Labels
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var mphLabel: UILabel!
    
    var timer = Timer()
    var counter = 00.0
    
    // Check if timer is running
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "\(counter)"
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func playButtonDidTouch(_ sender: Any) {
        
        // mph results
        mphLabel.text = nil
        
        if !isRunning {
            timer = Timer.scheduledTimer(timeInterval: 00.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            
            playButton.isEnabled = false
            pauseButton.isEnabled = true
            
            isRunning = true
        }
    }
    
    
    
  
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        
        
        /* 40 yards to mph conversion equation
         
         (((3600 / (athlete 40 yd time) * 120) / 5280)
        
        */
        
        let mph = ((3600 / (counter) * 120) / 5280)
        
        playButton.isEnabled = true
        pauseButton.isEnabled =  false
        
        
        // mph results
        mphLabel.text = String(format: "MPH: %.2f", mph)
        
        // Pause timer
        timer.invalidate()
        isRunning = false
        
        
        
    }
    

    
    
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
    
     // Pause timmer
     timer.invalidate()
     
     // Stop timmer
     isRunning = false
     
     // Time label reset to zero
     counter = 0
     timeLabel.text = "\(counter)"
     
    // mph results
    mphLabel.text = nil
        
        
     playButton.isEnabled = true
     pauseButton.isEnabled = false
     }
     
    
    func updateTimer() {
        
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
        
        if counter > 60.0
        {
            // Pause timer
            timer.invalidate()
            isRunning = false
            
            // Disable the start and stop button
            playButton.isEnabled = false
            pauseButton.isEnabled = false
        }
    }
    
}

    
    
    


