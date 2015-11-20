//
//  ViewController.swift
//  SimpleAlert
//
//  Created by Lucian Piros on 08/11/2015.
//  Copyright © 2015 Lucian Piross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // NSTimer variable - used to count down
    var timer = NSTimer()
    // Number of seconds holder variable
    var seconds = 60;
    
    // IBOutlet variable for the UILabel
    @IBOutlet var timeLabel: UILabel!
    
    // IBOutlet variable for UIButton - used to restart demo
    @IBOutlet var restartButton: UIButton!
    
    // Restart timer and show label
    @IBAction func restartDemo(sender: AnyObject) {
        seconds = 60
        timeLabel.text = "\(seconds) seconds"
        restartButton.hidden = true
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("updateLabel"), userInfo: nil, repeats: true)
        NSLog("Demo is restarted - Show countdown again")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Hide restatButton
        restartButton.hidden = true;
        // start NSTimer to update UILabel every second
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("updateLabel"), userInfo: nil, repeats: true)
        NSLog("View loaded - NSTimer started")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //update UILabel on main page every seconds
    // if number of seconds is down to zero invalidate / stop timer
    func updateLabel() {
        --seconds
        
        NSLog("Update count down label with %d seconds", seconds)
        
        // Check if all alloted time has passed
        if seconds == 0 {
            NSLog("Down to zero. Invalidate NSTimer");
            
            timer.invalidate()
            timeLabel.text = ""
            showAlert()
        }
        else {
            if seconds > 1 {
                timeLabel.text = "\(seconds) seconds"
            }
            else {
                timeLabel.text = "\(seconds) second"
            }
        }
    }
    
    // Method used to display an alert
    func showAlert() {
        NSLog("Show Alert View");
        
        // Create an alert controller
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "Please update your license", preferredStyle: .Alert)
        
        // Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            // Show "Restart Demo" Button
            self.restartButton.hidden = false;
        }
        alertController.addAction(cancelAction)
        
        let nextAction: UIAlertAction = UIAlertAction(title: "Enter License", style: .Default) { action -> Void in
            // No action here yet. Might be added in the future
        }
        alertController.addAction(nextAction)
        
        // Present the AlertController
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

