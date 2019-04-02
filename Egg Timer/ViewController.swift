//
//  ViewController.swift
//  Egg Timer
//
//  Created by AAJM van Montfort on 01/04/2019.
//  Copyright © 2019 AAJM van Montfort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var seconds = 210
    
    @objc func timerAction() {
        labelCounter.text = String(seconds)
        
        if seconds >= 1  {
            seconds -= 1
        } else {
            timer.invalidate()
            lblButtonPlay.isEnabled = true
            lblButtonPause.isEnabled = false        }
    }

    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var lblButtonPlay: UIBarButtonItem!
    @IBOutlet weak var lblButtonPause: UIBarButtonItem!
    
    @IBAction func buttonPause(_ sender: Any) {
        timer.invalidate()
        lblButtonPlay.isEnabled = true
        lblButtonPause.isEnabled = false
    }
 
    @IBAction func buttonPlay(_ sender: Any) {
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        lblButtonPlay.isEnabled = false
        lblButtonPause.isEnabled = true
    }
    
    @IBAction func buttonReset(_ sender: Any) {
        seconds = 210
    }
    
    @IBAction func buttonMinus10(_ sender: Any) {
        if seconds > 10 {
            seconds -= 10
        }
    }
    
    @IBAction func buttonPlus10(_ sender: Any) {
        seconds += 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelCounter.text = String(seconds)
        lblButtonPause.isEnabled = false
    }


}

