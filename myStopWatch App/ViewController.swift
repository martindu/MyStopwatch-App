//
//  ViewController.swift
//  myStopWatch App
//
//  Created by Martin Dureja on 12/29/14.
//  Copyright (c) 2014 Martin Dureja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hour = 0
    var min = 0
    var sec = 1
    var minInstring = " "
    var secInString = " "
    var timer = NSTimer()
    var isStarted = false
    
    @IBOutlet var resultLabel: UILabel!
   
    
    func result(){
        
        if(sec > 59){
            sec = 0
            min += 1
        }
        if(min > 59){
            min = 0
            sec = 0
            hour += 1
        }
        minInstring = String(min)
        secInString = String(sec)
        
        if(min < 10){
            minInstring = "0" + String(min)
        }
        if(sec < 10){
            secInString = "0" + String(sec)
        }
        resultLabel.text = "\(String(hour)):\(minInstring):\(String(sec))"
        
        println("\(hour):\(minInstring):\(secInString)")
        
        sec += 1
    }
    
    @IBAction func playButton(sender: AnyObject) {
        
        if(isStarted == false){
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
            
            isStarted =  true
        }
    }
    @IBAction func pauseButton(sender: AnyObject) {
        if(isStarted == true){
            timer.invalidate()
            isStarted = false
        }
        else if(isStarted == false){

        }
    }
    @IBAction func resetButton(sender: AnyObject) {
        timer.invalidate()
        min = 0
        sec = 0
        hour = 0
        resultLabel.text = "0:00:00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

